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
    return Scaffold(
      appBar: const CustomAppBar(title: 'Sign up'),
      body: Column(
        children: [
          const CustomTextField(),
          const SizedBox(height: 20),
          const CustomTextField(),
          const SizedBox(height: 20),
          CustomTextButton(
              text: 'Already have an account?',
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
