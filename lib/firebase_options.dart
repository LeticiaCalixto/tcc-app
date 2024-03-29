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
    apiKey: 'AIzaSyD-dKSod96OPW8qTFKOWJz3IDEIfF9ajP4',
    appId: '1:162833568216:web:106274ca1cc809529a22ad',
    messagingSenderId: '162833568216',
    projectId: 'tempmetter-app',
    authDomain: 'tempmetter-app.firebaseapp.com',
    databaseURL: 'https://tempmetter-app-default-rtdb.firebaseio.com/',
    storageBucket: 'tempmetter-app.appspot.com',
    measurementId: 'G-JZ4MR8KF9G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbZfA3U7x4Eqz396pJveVdMU5UuEI1YBY',
    appId: '1:162833568216:android:b41ec4e38a5805629a22ad',
    messagingSenderId: '162833568216',
    databaseURL: 'https://tempmetter-app-default-rtdb.firebaseio.com/',
    projectId: 'tempmetter-app',
    storageBucket: 'tempmetter-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAymHi34AV-rjUEy9sougikBYgPCB1jYRA',
    appId: '1:162833568216:ios:08e776db4cff97f09a22ad',
    messagingSenderId: '162833568216',
    projectId: 'tempmetter-app',
    databaseURL: 'https://tempmetter-app-default-rtdb.firebaseio.com/',
    storageBucket: 'tempmetter-app.appspot.com',
    iosBundleId: 'com.example.tccApp',
  );
}
