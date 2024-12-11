import 'dart:async';
import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:ecommerce/registration_login/login.dart';
import 'package:ecommerce/tabbars/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'secrets.dart';

/// INITIALIZE FIREBASE
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: Secrets.FIREBASE_API_KEY,
        appId: Secrets.FIREBASE_APP_ID,
        messagingSenderId: Secrets.FIREBASE_MESSAGING_SENDER_ID,
        projectId: Secrets.FIREBASE_PROJECT_ID)
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
/// THIS WIDGET IS THE ROOT OF YOUR APPLICATION.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: opacityWhite,
      ),
      home: const MainPage(),
    );
  }
}

/// SPLASH SCREEN
class _Splash extends StatefulWidget {
  const _Splash();

  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<_Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7),
            ()=>Navigator.push(context,
            MaterialPageRoute(builder:
                (context) =>
            const Login(),
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashColor,
      body: Center(
          child: DefaultTextStyle(
            style: const TextStyle(color: whiteColor, fontSize: 30, fontWeight: FontWeight.bold),
            child: AnimatedTextKit(
                repeatForever: false,
                isRepeatingAnimation: false,
                animatedTexts: [
                  WavyAnimatedText('CLOTIN WEARZ')
                ]
            ),
          )
      ),
    );
  }
}
