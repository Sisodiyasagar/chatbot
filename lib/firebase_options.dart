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
    apiKey: 'AIzaSyDQFHECXjLV61VlrN2NdO5xt4ocWjCnPKs',
    appId: '1:473156443421:web:2f7966197ec687957d15f4',
    messagingSenderId: '473156443421',
    projectId: 'ai-jurist',
    authDomain: 'ai-jurist.firebaseapp.com',
    storageBucket: 'ai-jurist.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBt0bu-udvi2MvHct0U9NBcqzzJ0188kPY',
    appId: '1:473156443421:android:b8938472411a36037d15f4',
    messagingSenderId: '473156443421',
    projectId: 'ai-jurist',
    storageBucket: 'ai-jurist.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkeB6mf-NsMgfTUhIO9273dkdvFxO0Res',
    appId: '1:473156443421:ios:a28ea8149c8338a97d15f4',
    messagingSenderId: '473156443421',
    projectId: 'ai-jurist',
    storageBucket: 'ai-jurist.appspot.com',
    iosBundleId: 'com.example.chatgpt',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAkeB6mf-NsMgfTUhIO9273dkdvFxO0Res',
    appId: '1:473156443421:ios:313b8960c33288737d15f4',
    messagingSenderId: '473156443421',
    projectId: 'ai-jurist',
    storageBucket: 'ai-jurist.appspot.com',
    iosBundleId: 'com.example.chatgpt.RunnerTests',
  );
}
