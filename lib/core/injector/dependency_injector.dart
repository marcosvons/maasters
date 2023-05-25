import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:maasters/core/boxes/boxes.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  final hiveBoxes = HiveBoxes();
  await hiveBoxes.initBoxes();
  final firebaseAuth = FirebaseAuth.instance;
  final cloudFirestore = FirebaseFirestore.instance;

  getIt
    ..registerLazySingleton(() => firebaseAuth)
    ..registerLazySingleton(() => cloudFirestore)
    ..registerLazySingleton<IAuthLocalService>(
      () => AuthLocalService(hiveBoxes.userBox),
    )
    ..registerLazySingleton<IAuthRepository>(
      () => AuthRepository(
        firebaseAuth: getIt(),
        authLocalService: getIt(),
        firestore: getIt(),
      ),
    );
}
