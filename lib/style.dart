import 'package:flutter/material.dart';

class Style {
  // COLORS
  static const titleColor = Colors.white;
  static const mainColor = Color.fromRGBO(16, 115, 197, 1);
  static const secondaryColor = Color.fromRGBO(57, 57, 82, 1);
  static const greyColor = Color.fromRGBO(164, 197, 205, 1);

  // STYLES
  static const TextStyle username = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w800,
    fontSize: 20,
  );
  static const TextStyle name = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Colors.black26,
  );

  static const TextStyle titlePost = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );
  static const TextStyle contentPost = TextStyle(
    fontFamily: "Nunito",
    fontSize: 20,
  );

  static const TextStyle nameComment = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );
  static const TextStyle contentComment = TextStyle(
    fontFamily: "Nunito",
    fontSize: 18,
  );

  static const TextStyle textFormFieldTitle = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  static const TextStyle textFormFieldContent = TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  static const TextStyle buttonText = TextStyle(
    fontFamily: "Nunito",
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle title = TextStyle(
    fontFamily: "Nunito",
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
