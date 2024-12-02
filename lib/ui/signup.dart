import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

/// SIGN UP SCREEN
class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _SignupState();
}
class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Sign up'),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
               CustomTextField(
                controller: emailController,
                labelText: 'email',
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Please enter an email';
                     }
                     if (!value.isValidEmail()) {
                       return 'Please enter a valid email address';
                     }
                   }
              ),
              const SizedBox(height: 20),
               CustomTextField(
                controller: passwordController,
                labelText: 'password',
                   validator: (value) {
                     if (value == null || value.length < 6) {
                       return 'Password must be at least 6 characters';
                     }
                     return null;
                   }
              ),
              const SizedBox(height: 20),
              CustomTextButton(
                  text: 'Already have an account?',
                  onPressed: (){},
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                child: CustomButton(
                  text: 'LOGIN', buttonTextStyle: const TextStyle(color: whiteColor),
                    onPressed: (){},
                    color: redColor,
                  side: BorderSide.none,
                  buttonHeight: 50,
                  buttonWidth: MediaQuery.of(context).size.width,
                  borderRadius: 25,
                ),
              )
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
