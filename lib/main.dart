import 'package:chnganh/screens/login_screen.dart';
import 'package:chnganh/screens/login_screens/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/colors.dart';

void main() {
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
      home: LoginScreen(),
    );
  }
}
