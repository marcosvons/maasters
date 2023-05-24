// ignore_for_file: public_member_api_docs

import 'package:auth/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

abstract class IAuthRepository {
  Stream<Option<User>> get user;
  Future<Either<AuthFailure, Unit>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<AuthFailure, Unit>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<AuthFailure, firebase_auth.UserCredential>> loginWithGoogle();
  //update firestore user
  Future<Either<Failure, Unit>> updateFirestoreUser();
  Future<void> logout();
  Stream<Either<Failure, User>> get firestoreUser;
}

class AuthRepository implements IAuthRepository {
  const AuthRepository({
    required firebase_auth.FirebaseAuth firebaseAuth,
    required IAuthLocalService authLocalService,
  })  : _firebaseAuth = firebaseAuth,
        _authLocalService = authLocalService;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final IAuthLocalService _authLocalService;

  @override
  Stream<Option<User>> get user =>
      _firebaseAuth.authStateChanges().map((firebase_auth.User? user) {
        if (user != null) {
          //fetch user from firestore
          return some(
            const User(firstName: '', lastName: '', mail: '', id: ''),
          );
        } else {
          return none();
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
      // Once signed in, return the UserCredential
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
  // TODO: implement firestoreUser
  Stream<Either<Failure, User>> get firestoreUser =>
      _authLocalService.userStream.map((userDto) {
        try {
          return Right(userDto.toModel());
        } catch (e) {
          return const Left(Failure.parseModel());
        }
      });

  @override
  Future<Either<Failure, Unit>> updateFirestoreUser() async {
    return const Left(Failure.cache());
  }
}
