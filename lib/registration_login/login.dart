import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import '../tabbars/home_page.dart';

/// LOGIN SCREEN
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
/// GLOBAL KEY FOR THE FORM STATE AND CONTROLLERS FOR EMAIL/PASSWORD INPUT FIELD
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!value.isValidEmail()) {
                    return 'Please enter a valid email address';
                  }
                  return null;
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
                text: 'Forgot your password?',
                onPressed: (){},
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  text: 'LOGIN', buttonTextStyle: const TextStyle(color: whiteColor),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  },
                  color: redColor,
                  side: BorderSide.none,
                  buttonHeight: 50,
                  buttonWidth: MediaQuery.of(context).size.width,
                  borderRadius: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
 /// DISPOSING THE CONTROLLERS
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
