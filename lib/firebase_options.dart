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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC725rOil9Mu78kvoVAFPRZrIy9E48AjdI',
    appId: '1:757277149620:android:731978306f149d24c38ae1',
    messagingSenderId: '757277149620',
    projectId: 'peldev-flash-chat',
    storageBucket: 'peldev-flash-chat.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQtpoM9F7zWp1CgmjKhKOF0Sa4BDk6Su0',
    appId: '1:757277149620:ios:3b22018f90adecbac38ae1',
    messagingSenderId: '757277149620',
    projectId: 'peldev-flash-chat',
    storageBucket: 'peldev-flash-chat.appspot.com',
    iosClientId: '757277149620-v85jonit01rgd4k0lgerhkq8snms7kf8.apps.googleusercontent.com',
    iosBundleId: 'com.example.jflashchat',
  );
}
