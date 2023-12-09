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
        return macos;
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
    apiKey: 'AIzaSyAUV9BeLx3c6JMNmuoUof3QMy8fztRoolQ',
    appId: '1:793480633492:web:7ddfdb14962441ac836881',
    messagingSenderId: '793480633492',
    projectId: 'finnit-3636f',
    authDomain: 'finnit-3636f.firebaseapp.com',
    storageBucket: 'finnit-3636f.appspot.com',
    measurementId: 'G-LEHBRYM81S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDad3uxZrIkHmmnsRdPqr0scxaXpsfQu1E',
    appId: '1:793480633492:android:64c8d097f9f83055836881',
    messagingSenderId: '793480633492',
    projectId: 'finnit-3636f',
    storageBucket: 'finnit-3636f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEe7g6XF8sCl0ypL3eQqb--HnBfFduIv4',
    appId: '1:793480633492:ios:08a3af768bc2706e836881',
    messagingSenderId: '793480633492',
    projectId: 'finnit-3636f',
    storageBucket: 'finnit-3636f.appspot.com',
    iosBundleId: 'com.example.futureit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEe7g6XF8sCl0ypL3eQqb--HnBfFduIv4',
    appId: '1:793480633492:ios:c0a050d9b698ae59836881',
    messagingSenderId: '793480633492',
    projectId: 'finnit-3636f',
    storageBucket: 'finnit-3636f.appspot.com',
    iosBundleId: 'com.example.futureit.RunnerTests',
  );
}
