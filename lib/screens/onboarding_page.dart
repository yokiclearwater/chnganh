import 'package:chnganh/screens/login_page.dart';

import 'package:chnganh/screens/sign_up_page.dart';
import 'package:chnganh/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
          child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Chnanh',
            body: "ឆ្ងាញ់",
            image: builImage("assets/pngegg.png"),
            decoration: startPagedecoration(),
          ),
          PageViewModel(
            title: '" Good food is the Foundation of Genuine happiness.',
            body:
                'Fish and seafood such as salmon , squid and prawns are the domainant meats in Cambodian cuisine, followed by pork, chicken,duck, and beef in a soups,stir-fries and curries.',
            image: builImage('assets/dish2.png'),
            decoration: getPagedecoration(),
          ),
          PageViewModel(
            title: '" Nothing brings People Together Like good Food.',
            body:
                'Roasted Garlic & Sharing Pizza Yellow Cab Pizza Co.Camobodia.',
            footer: Container(
              child: Column(
                children: [
                  ButtonWidget(
                    text: 'Go to Sign in',
                    onClicked: () => Login(context),
                  ),
                  ButtonSignup(
                      text: 'No Account yet ? Sign up here.',
                      onClicked: () => Signup(context))
                ],
              ),
            ),
            image: builImage("assets/P2.png"),
            decoration: getPagedecoration(),
          ),
        ],
        done: Text(
          "",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        onDone: () => Login(context),
        showSkipButton: true,
        skip: Text('Skip'),
        onSkip: () => Login(context),
        next: Text('Next'),
        dotsDecorator: getDotDecoration(),
        onChange: (index) => print('page $index selected'),
        //  globalBackgroundColor: Theme.of(context).primaryColor,
        // dotsFlex: 0,
        // nextFlex: 0,
      ));
  void Login(context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => LoginPage()));
  void Signup(context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => const SignUpPage()));

  Widget builImage(String path) => Center(
        child: Image.asset(
          path,
          width: 350,
        ),
      );
  DotsDecorator getDotDecoration() => DotsDecorator(
      color: Color.fromARGB(255, 156, 154, 154),
      size: Size(10, 10),
      activeSize: Size(22, 10),
      activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
  PageDecoration getPagedecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        imagePadding: EdgeInsets.all(24),
        //titlePadding: EdgeInsets.all(16).copyWith(bottom: 0),
        pageColor: Color.fromRGBO(71, 181, 255, 1),
      );
  PageDecoration startPagedecoration() => PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
      bodyTextStyle: TextStyle(fontSize: 40),
      pageColor: Color.fromRGBO(71, 181, 255, 1));
}
