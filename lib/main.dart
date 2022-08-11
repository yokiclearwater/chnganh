import 'package:chnganh/screens/login_page.dart';
import 'package:chnganh/screens/onboarding_page.dart';
import 'package:chnganh/screens/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final String title = 'Onboarding Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: GoogleFonts.lato().fontFamily,
            ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Chnganh',
      home: OnBoardingPage(),
    );
  }
}
