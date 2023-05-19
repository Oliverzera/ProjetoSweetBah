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
    apiKey: 'AIzaSyC40FeU17AuE92G3uIWYOarvhiBSMbo9Rc',
    appId: '1:817537227901:web:a5506a8903ff451493e514',
    messagingSenderId: '817537227901',
    projectId: 'app-fatecrp-tarefas-noite',
    authDomain: 'app-fatecrp-tarefas-noite.firebaseapp.com',
    storageBucket: 'app-fatecrp-tarefas-noite.appspot.com',
    measurementId: 'G-06W53ZN591',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsLb9_PnWPvduJX-VSk4Q8bNnT39EJi3Q',
    appId: '1:817537227901:android:e5d8d4a4f546c4f793e514',
    messagingSenderId: '817537227901',
    projectId: 'app-fatecrp-tarefas-noite',
    storageBucket: 'app-fatecrp-tarefas-noite.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWHIl33S3ZMy8INI1SHsWsH-5o05eYW1E',
    appId: '1:817537227901:ios:e97bcc2f36393d9793e514',
    messagingSenderId: '817537227901',
    projectId: 'app-fatecrp-tarefas-noite',
    storageBucket: 'app-fatecrp-tarefas-noite.appspot.com',
    iosClientId:
        '817537227901-qe16jhf15ian4n24mo49sdcjqbbpd4q9.apps.googleusercontent.com',
    iosBundleId: 'com.example.app09ListaTarefas',
  );
}