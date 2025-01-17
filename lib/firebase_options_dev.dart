// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_dev.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyALJY2ttgOaZmoNrnFW0rsGOLBifN2I3rE',
    appId: '1:363155223436:web:aafd0428ec7cd0d5415ca9',
    messagingSenderId: '363155223436',
    projectId: 'maasters-dev',
    authDomain: 'maasters-dev.firebaseapp.com',
    storageBucket: 'maasters-dev.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDettmz7d9o8H90A_FASlhx4PxuUsTtHNk',
    appId: '1:363155223436:android:805ca9aed13a64a1415ca9',
    messagingSenderId: '363155223436',
    projectId: 'maasters-dev',
    storageBucket: 'maasters-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrrY3RkapKfd1JBGPN0yjip9DTRfxnpzk',
    appId: '1:363155223436:ios:6e05bd1554f7c272415ca9',
    messagingSenderId: '363155223436',
    projectId: 'maasters-dev',
    storageBucket: 'maasters-dev.appspot.com',
    iosClientId:
        '363155223436-e6ln2iiupqj9qf9b8rocfnube4qt47jc.apps.googleusercontent.com',
    iosBundleId: 'com.example.verygoodcore.maasters.dev',
  );
}
