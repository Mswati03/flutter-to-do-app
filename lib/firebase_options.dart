// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
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
    apiKey: 'AIzaSyD5fZxFRvjT8W0zlzgI89RmQn9syk8P9Sg',
    appId: '1:781907643033:web:8adc09b613e9bac09f8608',
    messagingSenderId: '781907643033',
    projectId: 'to-do-app-mswatitech',
    authDomain: 'to-do-app-mswatitech.firebaseapp.com',
    storageBucket: 'to-do-app-mswatitech.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSJJI_xSe0hYisKCVPUZYgpVWF6IkXPvU',
    appId: '1:781907643033:android:6a199ce06c4edb169f8608',
    messagingSenderId: '781907643033',
    projectId: 'to-do-app-mswatitech',
    storageBucket: 'to-do-app-mswatitech.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrW7rF0oaQ-g4EAit0VJfK0xmcQbMPx4I',
    appId: '1:781907643033:ios:1a6b2404048853e09f8608',
    messagingSenderId: '781907643033',
    projectId: 'to-do-app-mswatitech',
    storageBucket: 'to-do-app-mswatitech.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );
}