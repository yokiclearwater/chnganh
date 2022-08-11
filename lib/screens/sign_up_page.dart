import 'package:chnganh/constants/colors.dart';
import 'package:chnganh/screens/onboarding_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/textfield_widget.dart';

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
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => OnBoardingPage()));
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: accentColor,
                  )),
            ),
            Container(
              padding: EdgeInsets.all(25),
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create A New Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(height: 10),
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
                      controller: _fullNameController,
                      label: 'Full Name',
                      validator: requiredValidator,
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      controller: _emailController,
                      label: 'E-Mail',
                      validator: emailValidator,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.mail,
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      controller: _passwordController,
                      label: 'Password',
                      validator: passwordValidator,
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
                    TextFieldWidget(
                      controller: _phoneNumberController,
                      label: 'Phone Number',
                      validator: phoneNumberValidator,
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.lock,
                    ),
                    const SizedBox(height: 30),
                    _buildButton(),
                  ],
                ),
              ),
            ),
          ],
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
            await signUp();
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => OnBoardingPage()));
          }
        },
        child: Text(
          'Sign Up',
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

  Future signUp() async {
    // firebase sign-up
    try {
      final authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      )
          .then((value) async {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(value.user!.uid)
            .set({
          'fullName': _fullNameController.text,
          'email': _emailController.text,
          'phoneNumber': _phoneNumberController.text,
        });
      });
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  String? requiredValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'This field is required';
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

  String? confirmPasswordValidator(String? confrimPasswordText) {
    if (confrimPasswordText == null || confrimPasswordText.isEmpty) {
      return 'This field is required';
    }

    if (confrimPasswordText.length < 6) {
      return 'Password must be at least 6 characters';
    }

    if (confrimPasswordText != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? emailValidator(value) {
    if (value!.isEmpty || !EmailValidator.validate(value)) {
      return 'Please enter email';
    }
    return null;
  }

  String? phoneNumberValidator(value) {
    if (value!.isEmpty ||
        !RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
            .hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }
}
