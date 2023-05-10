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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCPxeW4b_ds47ZDy5wtFToiwo3msDe6ZDw',
    appId: '1:37472328879:web:4a4e2511f48ef19ea9485a',
    messagingSenderId: '37472328879',
    projectId: 'drone4u-feb4a',
    authDomain: 'drone4u-feb4a.firebaseapp.com',
    storageBucket: 'drone4u-feb4a.appspot.com',
    measurementId: 'G-3CL0D05N2C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdMON2kdnSCNq1ff-u6_3WR9RwEy34FrI',
    appId: '1:37472328879:android:b1b491de90806f35a9485a',
    messagingSenderId: '37472328879',
    projectId: 'drone4u-feb4a',
    storageBucket: 'drone4u-feb4a.appspot.com',
  );
}
