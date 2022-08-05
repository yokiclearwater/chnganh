import 'package:chnganh/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: SingleChildScrollView(child: _buildBody()),
      ),
    );
  }

  Column _buildBody() => Column(
        children: [
          Image.asset('assets/pngegg.png'),
          Text(
            'Log In',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: accentColor,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: TextField(
              onChanged: ((value) {
                _email = value;
              }),
              decoration: InputDecoration(
                hintText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: TextField(
              onChanged: ((value) {
                _password = value;
              }),
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: signIn,
            child: Text(
              'Log In',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      );

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.trim(), password: _password.trim());
  }
}
