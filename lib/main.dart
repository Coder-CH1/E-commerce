import 'dart:async';
import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:ecommerce/ui/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

/// INITIALIZE FIREBASE
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyCt5GocTEpVcwE7VmlqRzyy3Ndg67bKQ_Y',
        appId: '1:268987935569:android:3e0c44d4933d70709fc170',
        messagingSenderId: '268987935569',
        projectId: 'ecommerce-4963a'));
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
    return Container(
        color: Colors.white,
        child: Container(
          color: splashColor,
          child: const CustomText(text: 'Hoodies', style: TextStyle(
            fontSize: 40,
            color: whiteColor,
            fontWeight: FontWeight.bold,
          )),
        )
    );
  }
}
