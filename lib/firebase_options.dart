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
    apiKey: 'AIzaSyBovP7opn6ztky1ZPARqUTsr9-IKIdy2t4',
    appId: '1:895619022354:web:0daa0be766c0a45a8c22cb',
    messagingSenderId: '895619022354',
    projectId: 'firebase-dc',
    authDomain: 'fir-dc-cf94f.firebaseapp.com',
    storageBucket: 'firebase-dc.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDV0cVJo4CKrN7tIknF9IbxrS00iDmd98U',
    appId: '1:895619022354:android:4558d3ba57af42938c22cb',
    messagingSenderId: '895619022354',
    projectId: 'firebase-dc',
    storageBucket: 'firebase-dc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAU1gh_9WgWjxV4PVpURnRD4ijpA8vAlBY',
    appId: '1:895619022354:ios:9663430af9f68dd78c22cb',
    messagingSenderId: '895619022354',
    projectId: 'firebase-dc',
    storageBucket: 'firebase-dc.firebasestorage.app',
    iosBundleId: 'com.example.firebaseDc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAU1gh_9WgWjxV4PVpURnRD4ijpA8vAlBY',
    appId: '1:895619022354:ios:9663430af9f68dd78c22cb',
    messagingSenderId: '895619022354',
    projectId: 'firebase-dc',
    storageBucket: 'firebase-dc.firebasestorage.app',
    iosBundleId: 'com.example.firebaseDc',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBovP7opn6ztky1ZPARqUTsr9-IKIdy2t4',
    appId: '1:895619022354:web:3113bce7fac98de08c22cb',
    messagingSenderId: '895619022354',
    projectId: 'firebase-dc',
    authDomain: 'fir-dc-cf94f.firebaseapp.com',
    storageBucket: 'firebase-dc.firebasestorage.app',
  );
}
