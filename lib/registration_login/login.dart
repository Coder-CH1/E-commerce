import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:ecommerce/registration_login/signup.dart';
import 'package:flutter/material.dart';
import '../firebase/auth_manager/auth.dart';
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
  bool isLoading = false;

  final AuthManager _authManager = AuthManager();

  /// METHOD TO HANDLE SIGN IN FOR A FIREBASE USER
  Future<void> _signin() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });
      String? email = emailController.text.trim();
      String? password = passwordController.text.trim();

      String? result = await _authManager.signIn(email: email, password: password);

      setState(() {
        isLoading = false;
      });

      if (result == null) {
        if (!mounted) return;
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      } else {

      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Login',
          leading: IconButton(
          onPressed: () {
    Navigator.pop(context);
    },
        icon: const
        Icon(Icons.arrow_back_ios_new_sharp, color: darkBlue)
    ),
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
                  obscureText: true,
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
                    if (!isLoading) _signin();
                  },
                  color: redColor,
                  side: BorderSide.none,
                  buttonHeight: 50,
                  buttonWidth: MediaQuery.of(context).size.width,
                  borderRadius: 25,
                ),
              ),
              Row(
                children: [
                  const CustomText(text: "Don't have an account?", style: TextStyle(fontSize: 14)),
                  CustomTextButton(
                    text: 'Sign up',
                    buttonTextStyle: const TextStyle(fontSize: 26),
                    onPressed: (){
                      Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      );
                    },
                  ),
                ],
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
