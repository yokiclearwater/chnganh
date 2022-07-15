import 'package:chnganh/main.dart';
import 'package:chnganh/screens/login_screens/onboarding_page.dart';
import 'package:chnganh/widget/button_widget.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sig up page',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 24,
            ),
            ButtonWidget(
                text: 'Go back', onClicked: () => goOnBoardingPage(context))
          ],
        )),
      );
  void goOnBoardingPage(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnBoardingPage()),
      );
}
