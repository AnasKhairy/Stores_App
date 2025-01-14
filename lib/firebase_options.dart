// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyDd0BdRFuJTu8yuf1iqvRw8PYs_fLdTGWg',
    appId: '1:550680308948:web:576a5d0cd263b26661df41',
    messagingSenderId: '550680308948',
    projectId: 'stores-app-99f56',
    authDomain: 'stores-app-99f56.firebaseapp.com',
    storageBucket: 'stores-app-99f56.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDI2SN_0iNI1kismqmUpNZHUoBT1dUJx2o',
    appId: '1:550680308948:android:f15a9fe8aa3da7ef61df41',
    messagingSenderId: '550680308948',
    projectId: 'stores-app-99f56',
    storageBucket: 'stores-app-99f56.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwvQvAHjuPulkaShD_eVvUUBfwGMeksBM',
    appId: '1:550680308948:ios:0c1793b18a2c906661df41',
    messagingSenderId: '550680308948',
    projectId: 'stores-app-99f56',
    storageBucket: 'stores-app-99f56.firebasestorage.app',
    iosBundleId: 'com.example.elFares',
  );

}