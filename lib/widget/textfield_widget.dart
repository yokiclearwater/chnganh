import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final bool password;
  final IconData prefixIcon;

  const TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.label,
      this.password = false,
      this.keyboardType,
      this.validator,
      required this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      keyboardType: keyboardType,
      validator: validator,
      cursorColor: primaryColor,
      style: TextStyle(
        color: primaryColor,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        prefixIcon: Icon(
          prefixIcon,
          color: accentColor,
        ),
        fillColor: textColor,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        labelStyle: const TextStyle(
          color: accentColor,
          fontSize: 18,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
