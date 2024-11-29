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
              text: 'Forgot your password?',
              onPressed: (){},
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'SIGN UP', buttonTextStyle: const TextStyle(color: whiteColor),
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
