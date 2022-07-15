import 'package:chnganh/constants/colors.dart';
import 'package:chnganh/screens/login_screens/onboarding_page.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: buildBody(),
    );
  }

  buildBody() {
    var outlineInputBorder = OutlineInputBorder(
      // borderSide: BorderSide(color: textColor),
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    );
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
              // height: double.infinity,
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
                  buildTextField(
                    outlineInputBorder,
                    lableText: 'Full Name',
                    prefixIcon: Icons.person,
                    inputType: TextInputType.text,
                    hideInput: false,
                  ),
                  const SizedBox(height: 10),
                  buildTextField(
                    outlineInputBorder,
                    lableText: 'E-Mail',
                    prefixIcon: Icons.mail,
                    inputType: TextInputType.emailAddress,
                    hideInput: false,
                  ),
                  const SizedBox(height: 10),
                  buildTextField(
                    outlineInputBorder,
                    lableText: 'Password',
                    prefixIcon: Icons.lock,
                    inputType: TextInputType.visiblePassword,
                    hideInput: true,
                  ),
                  const SizedBox(height: 10),
                  buildTextField(
                    outlineInputBorder,
                    lableText: 'Confirm Password',
                    prefixIcon: Icons.lock,
                    inputType: TextInputType.visiblePassword,
                    hideInput: true,
                  ),
                  const SizedBox(height: 10),
                  buildTextField(
                    outlineInputBorder,
                    lableText: 'Phone Number',
                    prefixIcon: Icons.phone,
                    inputType: TextInputType.phone,
                    hideInput: false,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        primary: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTextField(OutlineInputBorder outlineInputBorder,
      {lableText, prefixIcon, inputType, hideInput}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(lableText,
        //     style: TextStyle(
        //       color: textColor,
        //       fontSize: 24,
        //       fontWeight: FontWeight.bold,
        //     )),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: accentColor.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(10, 10),
              )
            ],
          ),
          child: TextField(
            style: TextStyle(
              color: primaryColor,
              fontSize: 18,
            ),
            obscureText: hideInput,
            keyboardType: inputType,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              prefixIcon: Icon(
                prefixIcon,
                color: accentColor,
              ),
              fillColor: textColor,
              labelText: lableText,
              labelStyle: const TextStyle(
                color: accentColor,
                fontSize: 18,
              ),
              enabledBorder: outlineInputBorder,
              border: outlineInputBorder,
              focusedBorder: outlineInputBorder,
            ),
          ),
        ),
      ],
    );
  }
}
