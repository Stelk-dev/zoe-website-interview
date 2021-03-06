import 'package:flutter/material.dart';
import 'package:zoe/style.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  int maxLines = 1;
  TextStyle style;

  AppTextFormField({
    required this.controller,
    required this.validator,
    required this.hintText,
    this.maxLines = 1,
    this.style = Style.textFormFieldContent,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: style,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 2, color: Colors.grey),
        ),
        errorStyle: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 2, color: Colors.red),
        ),
      ),
    );
  }
}
