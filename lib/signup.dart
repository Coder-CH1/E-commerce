import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

/// SIGN UP SCREEN
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Sign up'),
      body: Column(
        children: [
          CustomTextField(),
          CustomTextField(),
          CustomButton(
              text: text,
              onPressed: onPressed,
              color: color
          )
        ],
      ),
    );
  }
}
