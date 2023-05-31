// ignore_for_file: public_member_api_docs

import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

abstract class IAuthRepository {
  Stream<Either<Failure, Option<User>>> get firebaseUser;
  Stream<Either<Failure, User?>> get cacheUser;
  Future<Either<AuthFailure, Unit>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<AuthFailure, Unit>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<AuthFailure, firebase_auth.UserCredential>> loginWithGoogle();
  Future<Either<Failure, User?>> getFirestoreUser({required String id});
  Future<Either<Failure, Unit>> createFirestoreUser({
    required firebase_auth.User firebaseUser,
  });
  Future<Either<Failure, Unit>> updateFirestoreUser({
    required User user,
    Uint8List? image,
  });

  Future<String> uploadFirestoreUserImage({
    required String userId,
    required Uint8List image,
  });

  Future<void> logout();
}

class AuthRepository implements IAuthRepository {
  const AuthRepository({
    required firebase_auth.FirebaseAuth firebaseAuth,
    required IAuthLocalService authLocalService,
    required FirebaseFirestore firestore,
    required FirebaseStorage firebaseStorage,
  })  : _firebaseAuth = firebaseAuth,
        _authLocalService = authLocalService,
        _firestore = firestore,
        _firebaseStorage = firebaseStorage;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final IAuthLocalService _authLocalService;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  @override
  Stream<Either<Failure, Option<User>>> get firebaseUser => _firebaseAuth
          .authStateChanges()
          .asyncMap((firebase_auth.User? user) async {
        try {
          if (user != null) {
            //fetch user from firestore
            final firestoreUser = await getFirestoreUser(id: user.uid);

            //check if firestore user is null
            return firestoreUser.fold(Left.new, (possibleFirestoreUser) async {
              //is null
              if (possibleFirestoreUser == null) {
                //create user in firestore
                final firestoreUserCreation =
                    await createFirestoreUser(firebaseUser: user);

                return firestoreUserCreation.fold(Left.new, (success) async {
                  await _authLocalService.setCacheUser(
                    userDto: UserDto.fromFirebaseUser(user),
                  );
                  return Right(some(UserDto.fromFirebaseUser(user).toModel()));
                });
              } else {
                //save user in cache
                await _authLocalService.setCacheUser(
                  userDto: UserDto.fromModel(possibleFirestoreUser),
                );
                return Right(some(possibleFirestoreUser));
              }
            });
          } else {
            await _authLocalService.removeCacheUser();
            return Right(none());
          }
        } on CacheException {
          return const Left(CacheFailure());
        } catch (e) {
          return const Left(ParseModelFailure());
        }
      });

  @override
  Stream<Either<Failure, User?>> get cacheUser =>
      _authLocalService.userStream.map((userDto) {
        try {
          if (userDto == null) {
            return const Right(null);
          }
          return Right(userDto.toModel());
        } catch (e) {
          return const Left(Failure.parseModel());
        }
      });

  @override
  Future<Either<AuthFailure, Unit>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return const Left(AuthFailure.userNotFoundError());
        case 'wrong-password':
          return const Left(AuthFailure.invalidCredentialsError());
        default:
          return const Left(AuthFailure());
      }
    } catch (e) {
      return const Left(AuthFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return const Left(
          AuthFailure.emailAlreadyExistsError(),
        );
      } else {
        return const Left(AuthFailure());
      }
    } catch (e) {
      return const Left(AuthFailure());
    }
  }

  @override
  Future<Either<AuthFailure, firebase_auth.UserCredential>>
      loginWithGoogle() async {
    final googleProvider = firebase_auth.GoogleAuthProvider();
    try {
      late final firebase_auth.AuthCredential credential;

      googleProvider
        ..addScope('https://www.googleapis.com/auth/contacts.readonly')
        ..setCustomParameters(
          {'login_hint': 'user@example.com'},
        );

      final userCredential =
          await _firebaseAuth.signInWithPopup(googleProvider);
      return Right(userCredential);
    } catch (e) {
      return const Left(AuthFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> logout() async {
    try {
      await _firebaseAuth.signOut();
      return const Right(unit);
    } catch (e) {
      return const Left(AuthFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> createFirestoreUser({
    required firebase_auth.User firebaseUser,
  }) async {
    try {
      final user = UserDto.fromFirebaseUser(firebaseUser);
      // save UserDto to firestore
      await _firestore
          .collection(Keys.usersCollection)
          .doc(user.id)
          .set(user.toJson())
          .onError(
            (error, stackTrace) =>
                const Left<FirestoreUserCreationFailure, Unit>(
              FirestoreUserCreationFailure(),
            ),
          );
      return const Right(unit);
    } catch (e) {
      return const Left(FirestoreUserCreationFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateFirestoreUser({
    required User user,
    Uint8List? image,
  }) async {
    try {
      User? userWithImage;
      if (image != null) {
        final imageUrl =
            await uploadFirestoreUserImage(userId: user.id, image: image);
        userWithImage = user.copyWith(photoUrl: imageUrl);
      }
      final userDto = UserDto.fromModel(userWithImage ?? user);
      // save UserDto to firestore
      await _firestore
          .collection(Keys.usersCollection)
          .doc(userDto.id)
          .set(userDto.toJson())
          .onError(
            (error, stackTrace) =>
                const Left<FirestoreUserCreationFailure, Unit>(
              FirestoreUserCreationFailure(),
            ),
          );
      await _authLocalService.setCacheUser(userDto: userDto);
      return const Right(unit);
    } on CloudStorageUploadException {
      return const Left(CloudStorageUploadFailure());
    } catch (e) {
      return const Left(FirestoreUserCreationFailure());
    }
  }

  @override
  Future<Either<Failure, User?>> getFirestoreUser({required String id}) async {
    try {
      final firestoreUser =
          await _firestore.collection(Keys.usersCollection).doc(id).get().then(
        (DocumentSnapshot document) {
          if (document.exists) {
            final userDto =
                UserDto.fromJson(document.data() as Map<String, dynamic>);
            return Right<Failure, User?>(userDto.toModel());
          } else {
            return const Right<Failure, User?>(null);
          }
        },
        onError: (e) => const Left<FirestoreGetUserFailure, User?>(
          FirestoreGetUserFailure(),
        ),
      );
      return firestoreUser;
    } catch (e) {
      return const Left(FirestoreGetUserFailure());
    }
  }

  @override
  Future<String> uploadFirestoreUserImage({
    required String userId,
    required Uint8List image,
  }) async {
    try {
      final ref = _firebaseStorage.ref().child('profile_pictures/$userId');
      final uploadTask = ref.putData(image);
      final snapshot = await uploadTask.whenComplete(() {});

      final photoUrl = await snapshot.ref.getDownloadURL();
      return photoUrl;
    } catch (e) {
      throw CloudStorageUploadException();
    }
  }
}
