import 'dart:async';
import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:ecommerce/ui/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

/// INITIALIZE FIREBASE
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
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
      home: const _Splash(),
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
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                const Signup()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashColor,
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              'HOODIES',
              speed: const Duration(milliseconds: 250),
              textStyle: const TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.w600
              ),
            ),
          ],
          totalRepeatCount: 2,
        ),
      ),
    );
  }
}
