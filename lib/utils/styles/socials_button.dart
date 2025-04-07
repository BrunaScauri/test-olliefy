import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';

class CustomButtons {
  static ElevatedButton socialsButton({
    required Color backgroundColor,
    required String assetPath,
    required String buttonText,
    required VoidCallback onPressed,
    required Color textColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(350, 60),
        shadowColor: Colors.black,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(
              assetPath,
              height: 18,
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyles.elevatedButtonText(color: textColor),
              children: [
                TextSpan(text: buttonText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
