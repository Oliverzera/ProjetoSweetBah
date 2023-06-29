import 'package:app_avaliacao/pages/home.page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import './pages/login.page.dart';
import 'firebase_options.dart';
import './pages/signup.page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => MaterialApp(
          title: 'Sweet Bah',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          initialRoute: 'login',
          routes: {
            'cadastrar': (context) => const SignupPage(),
            'login': (context) => const LoginPage(),
            'home': (context) => const HomePage(),
          },
        ),
      ),
    );
  });

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
