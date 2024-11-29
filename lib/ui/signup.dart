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
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            const CustomTextField(
              labelText: 'email',
            ),
            const SizedBox(height: 20),
            const CustomTextField(
              labelText: 'password',
            ),
            const SizedBox(height: 20),
            CustomTextButton(
                text: 'Already have an account?',
                onPressed: (){},
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'LOGIN', buttonTextStyle: const TextStyle(color: whiteColor),
                onPressed: (){},
                color: redColor,
              side: BorderSide.none,
              buttonHeight: 50,
              buttonWidth: MediaQuery.of(context).size.width,
              borderRadius: 25,
            )
          ],
        ),
      ),
    );
  }
}
