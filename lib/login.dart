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
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Login'
      ),
      body: Column(
        children: [
          const CustomTextField(),
          const SizedBox(height: 20),
          const CustomTextField(),
          const SizedBox(height: 20),
          CustomTextButton(
            text: 'Forgot your password?',
            onPressed: (){},
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: '',
            onPressed: (){},
            color: redColor,
          )
        ],
      ),
    );
  }
}
