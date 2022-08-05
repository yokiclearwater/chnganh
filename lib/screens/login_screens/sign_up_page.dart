import 'package:chnganh/main.dart';
import 'package:chnganh/screens/login_screens/onboarding_page.dart';
import 'package:chnganh/widget/textfield_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: _emailController,
                label: 'Email',
                validator: requiredValidator,
                prefixIcon: Icons.mail,
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: _passwordController,
                label: 'Password',
                validator: requiredValidator,
                keyboardType: TextInputType.visiblePassword,
                password: true,
                prefixIcon: Icons.lock,
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: _confirmPasswordController,
                label: 'Confirm Password',
                validator: confirmPasswordValidator,
                keyboardType: TextInputType.visiblePassword,
                password: true,
                prefixIcon: Icons.lock,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnBoardingPage(),
                      ),
                    );
                  }
                },
                // Elevated Button Style
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: Text('Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? requiredValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? confirmPasswordValidator(String? confrimPasswordText) {
    if (confrimPasswordText == null || confrimPasswordText.isEmpty) {
      return 'This field is required';
    }
    if (confrimPasswordText != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }
}
