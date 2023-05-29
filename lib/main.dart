import 'package:app_avaliacao/pages/home.page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './pages/login.page.dart';
import './pages/reset_password.page.dart';
import 'firebase_options.dart';
import './pages/signup.page.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MaterialApp(
        title: 'Sweet Bah',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        useInheritedMediaQuery: true,
        initialRoute: 'login',
        routes: {
          'cadastrar': (context) => SignupPage(),
          'login': (context) => LoginPage(),
          'home': (context) => HomePage(),
        },
      ),
    ),
  );
}
