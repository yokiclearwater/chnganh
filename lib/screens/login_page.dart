import 'package:chnganh/screens/onboarding_page.dart';
import 'package:chnganh/widget/button_widget.dart';
import 'package:chnganh/widget/textfield_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      backgroundColor: secondaryColor,
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 150,
                height: 15,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: _emailController,
                label: 'E-Mail',
                prefixIcon: Icons.mail,
                validator: emailValidator,
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: _passwordController,
                label: 'Password',
                prefixIcon: Icons.password,
                validator: passwordValidator,
                password: true,
              ),
              const SizedBox(height: 20),
              _buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var user = await signIn();
            if (user == null) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Error'),
                  content: const Text('Invalid email or password'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnBoardingPage()),
              );
            }
          }
        },
        child: Text(
          'Sign In',
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15),
          primary: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    // login with firebase
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }

    return null;
  }

  String? emailValidator(value) {
    if (value!.isEmpty || !EmailValidator.validate(value)) {
      return 'Please enter email';
    }
    return null;
  }

  String? passwordValidator(value) {
    if (value!.isEmpty) {
      return 'Please enter password';
    }
    if (value!.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
