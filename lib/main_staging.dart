import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maasters/app.dart';
import 'package:maasters/bootstrap.dart';

import 'package:maasters/firebase_options_stg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await bootstrap(() => const App());
}
