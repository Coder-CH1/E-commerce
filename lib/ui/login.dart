import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

/// LOGIN SCREEN
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Login'
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: emailController,
                labelText: 'email',
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: passwordController,
                labelText: 'password',
              ),
              const SizedBox(height: 20),
              CustomTextButton(
                text: 'Forgot your password?',
                onPressed: (){},
              ),
              const SizedBox(height: 20),
              Expanded(
              child:  Align(
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
}
