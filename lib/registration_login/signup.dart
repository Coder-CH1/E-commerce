import 'package:ecommerce/custom_widgets/custom_widgets.dart';
import 'package:ecommerce/firebase/auth_manager/auth.dart';
import 'package:flutter/material.dart';
import '../tabbars/home_page.dart';

/// SIGN UP SCREEN
class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _SignupState();
}
class _SignupState extends State<Signup> {
  /// GLOBAL KEY FOR THE FORM STATE AND CONTROLLERS FOR EMAIL/PASSWORD INPUT FIELD
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  final AuthManager _authManager = AuthManager();

/// METHOD TO HANDLE SIGN UP FOR A FIREBASE USER
  Future<void> _signup() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });
      String? email = emailController.text.trim();
      String? password = passwordController.text.trim();

      String? result = await _authManager.signUp(email: email, password: password);

      setState(() {
        isLoading = false;
      });

      if (result == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainPage()),
        );
      } else {
        _formKey.currentState?.validate();
      }
    }
  }

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
                  text: 'Already have an account?',
                  onPressed: (){},
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
              child: CustomButton(
                text: 'SIGNUP', buttonTextStyle: const TextStyle(color: whiteColor),
                  onPressed: () {
                    if (!isLoading) _signup();
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
