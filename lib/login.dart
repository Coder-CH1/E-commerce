import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

/// LOGIN SCREEN
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          title: 'Login'
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
