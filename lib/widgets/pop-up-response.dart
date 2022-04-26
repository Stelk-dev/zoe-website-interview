import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

class PopUpResponse {
  static void showPopUp({
    required String title,
    required Color color,
    required BuildContext context,
  }) {
    showFlash(
      context: context,
      duration: Duration(milliseconds: 3500),
      builder: (_, controller) => Flash(
        controller: controller,
        behavior: FlashBehavior.floating,
        position: FlashPosition.bottom,
        backgroundColor: color,
        boxShadows: kElevationToShadow[4],
        horizontalDismissDirection: HorizontalDismissDirection.horizontal,
        child: FlashBar(
          content: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
