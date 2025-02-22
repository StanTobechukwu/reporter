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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDLosDN91pF0A_hv4-FKhDoFTG5B5RqzRA',
    appId: '1:836052758130:web:6d06bd942a517019da1ceb',
    messagingSenderId: '836052758130',
    projectId: 'report-app-c7dd2',
    authDomain: 'report-app-c7dd2.firebaseapp.com',
    storageBucket: 'report-app-c7dd2.appspot.com',
    measurementId: 'G-R10ET0604M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsUsYEGXV6K1Ky7C2uPvgSF1_bh8rppYM',
    appId: '1:836052758130:android:c54cde30b3f9d3c8da1ceb',
    messagingSenderId: '836052758130',
    projectId: 'report-app-c7dd2',
    storageBucket: 'report-app-c7dd2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBt7YvxkHiUJtd0ysJNa6nMYzVbj2ByqB0',
    appId: '1:836052758130:ios:5baabda429f2f7c5da1ceb',
    messagingSenderId: '836052758130',
    projectId: 'report-app-c7dd2',
    storageBucket: 'report-app-c7dd2.appspot.com',
    iosBundleId: 'com.example.reportApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBt7YvxkHiUJtd0ysJNa6nMYzVbj2ByqB0',
    appId: '1:836052758130:ios:5baabda429f2f7c5da1ceb',
    messagingSenderId: '836052758130',
    projectId: 'report-app-c7dd2',
    storageBucket: 'report-app-c7dd2.appspot.com',
    iosBundleId: 'com.example.reportApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDLosDN91pF0A_hv4-FKhDoFTG5B5RqzRA',
    appId: '1:836052758130:web:f60cf1a01749966dda1ceb',
    messagingSenderId: '836052758130',
    projectId: 'report-app-c7dd2',
    authDomain: 'report-app-c7dd2.firebaseapp.com',
    storageBucket: 'report-app-c7dd2.appspot.com',
    measurementId: 'G-8TQXN25BBZ',
  );
}
