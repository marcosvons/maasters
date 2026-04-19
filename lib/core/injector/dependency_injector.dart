import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maasters/core/boxes/boxes.dart';
import 'package:mentorships/mentorships.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  final hiveBoxes = HiveBoxes();
  await hiveBoxes.initBoxes();
  final firebaseAuth = FirebaseAuth.instance;
  final cloudFirestore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;
  final googleSignIn = GoogleSignIn();

  getIt
    ..registerLazySingleton(() => firebaseAuth)
    ..registerLazySingleton(() => cloudFirestore)
    ..registerLazySingleton(() => firebaseStorage)
    ..registerLazySingleton(() => googleSignIn)
    ..registerLazySingleton<IAuthLocalService>(
      () => AuthLocalService(hiveBoxes.userBox),
    )
    ..registerLazySingleton<IAuthRepository>(
      () => AuthRepository(
        firebaseAuth: getIt(),
        authLocalService: getIt(),
        firestore: getIt(),
        firebaseStorage: getIt(),
        googleSignIn: getIt(),
      ),
    )
    ..registerLazySingleton<MentorshipsRepository>(
      () => MentorshipsRepository(
        firestore: getIt(),
      ),
    );
}
