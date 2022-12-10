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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCua2yPmvU5ERavxFoR3KoSxsvEHYgrLs8',
    appId: '1:1084001132759:android:cbb5e8aaa406157be49092',
    messagingSenderId: '1084001132759',
    projectId: 'qforum-18cd6',
    storageBucket: 'qforum-18cd6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDa401I1LFFBtmxB6chWcpSwkV8Xq8ArYU',
    appId: '1:1084001132759:ios:2f15cd47289ba485e49092',
    messagingSenderId: '1084001132759',
    projectId: 'qforum-18cd6',
    storageBucket: 'qforum-18cd6.appspot.com',
    androidClientId: '1084001132759-0valhsi85q9bdhmiii8motjj7otdoo1s.apps.googleusercontent.com',
    iosClientId: '1084001132759-j4aq6piomrgahj6h9vl6dc1lhcb5obmp.apps.googleusercontent.com',
    iosBundleId: 'com.example.qfoumn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDa401I1LFFBtmxB6chWcpSwkV8Xq8ArYU',
    appId: '1:1084001132759:ios:57d2bbb4a0a498fbe49092',
    messagingSenderId: '1084001132759',
    projectId: 'qforum-18cd6',
    storageBucket: 'qforum-18cd6.appspot.com',
    androidClientId: '1084001132759-0valhsi85q9bdhmiii8motjj7otdoo1s.apps.googleusercontent.com',
    iosClientId: '1084001132759-3k78nk1b036irshdnvlhok54cd5a88i7.apps.googleusercontent.com',
    iosBundleId: 'co',
  );
}
