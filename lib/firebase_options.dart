import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDl5zMnLyouOv8mOhqOG2A3WNZ8j5aH3kk',
    appId: '1:482207020889:web:99da658dae0c70d93d3e48',
    messagingSenderId: '482207020889',
    projectId: 'test-olliefy',
    authDomain: 'test-olliefy.firebaseapp.com',
    storageBucket: 'test-olliefy.firebasestorage.app',
    measurementId: 'G-4LYNL272SQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDP1oqr_zwFf_XB16suQpePWmjnB_AgM8Q',
    appId: '1:482207020889:android:4d885497c6fbd2603d3e48',
    messagingSenderId: '482207020889',
    projectId: 'test-olliefy',
    storageBucket: 'test-olliefy.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBaAGosyl_Cqj2Z5hjsRuYv4N_iGoOv7Io',
    appId: '1:482207020889:ios:6b452f8a0be5b0113d3e48',
    messagingSenderId: '482207020889',
    projectId: 'test-olliefy',
    storageBucket: 'test-olliefy.firebasestorage.app',
    iosBundleId: 'com.example.testOlliefy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBaAGosyl_Cqj2Z5hjsRuYv4N_iGoOv7Io',
    appId: '1:482207020889:ios:6b452f8a0be5b0113d3e48',
    messagingSenderId: '482207020889',
    projectId: 'test-olliefy',
    storageBucket: 'test-olliefy.firebasestorage.app',
    iosBundleId: 'com.example.testOlliefy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDl5zMnLyouOv8mOhqOG2A3WNZ8j5aH3kk',
    appId: '1:482207020889:web:1a581adee27a63ac3d3e48',
    messagingSenderId: '482207020889',
    projectId: 'test-olliefy',
    authDomain: 'test-olliefy.firebaseapp.com',
    storageBucket: 'test-olliefy.firebasestorage.app',
    measurementId: 'G-5NQF7HTFXG',
  );
}