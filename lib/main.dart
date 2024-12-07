import 'dart:async';
import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:ecommerce/ui/registration_login/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

/// INITIALIZE FIREBASE
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_API_KEY']!,
      appId: dotenv.env['FIREBASE_APP_ID']!,
      messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
      projectId: dotenv.env['FIREBASE_PROJECT_ID']!,),

  );
  try {
  await dotenv.load(fileName: ".env"); // Load environment variables
} catch (e) {
  throw Exception('Error loading .env file: $e'); // Print error if any
}
  runApp(const MyApp());
}

/// ACCESSING VARIABLES THROUGHOUT THE APP
void someFunction() {
  print(dotenv.env['FIREBASE_API_KEY']);
  print(dotenv.env['FIREBASE_APP_ID']);
  print(dotenv.env['FIREBASE_MESSAGING_SENDER_ID']);
  print(dotenv.env['FIREBASE_PROJECT_ID']);
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
            const Signup(),
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
              'CLOT',
              speed: const Duration(milliseconds: 100),
              textStyle: const TextStyle(color: whiteColor, fontSize: 24, fontWeight: FontWeight.bold,
              ),
            ),
          ],
          totalRepeatCount: 2,
        ),
      ),
    );
  }
}
