import 'package:chnganh/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: _buildBody(),
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
        ],
      );
}
