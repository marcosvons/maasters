import 'package:firebase_core/firebase_core.dart';
import 'package:maasters/app.dart';
import 'package:maasters/bootstrap.dart';

import 'package:maasters/firebase_options_stg.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await bootstrap(() => const App());
}
