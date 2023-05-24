import 'package:auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:maasters/core/boxes/boxes.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  final hiveBoxes = HiveBoxes();
  await hiveBoxes.initBoxes();
  final firebaseAuth = FirebaseAuth.instance;

  getIt
    ..registerLazySingleton(() => firebaseAuth)
    ..registerLazySingleton<IAuthLocalService>(
      () => AuthLocalService(hiveBoxes.userBox),
    )
    ..registerLazySingleton<IAuthRepository>(
      () => AuthRepository(
        firebaseAuth: getIt(),
        authLocalService: getIt(),
      ),
    );
}
