import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonStyles {
  static ButtonStyle elevatedButton({required Color backgroundColor}){
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      minimumSize: Size(350, 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0.0,
      shadowColor: Colors.transparent,
    );
  }
  
  static ButtonStyle socialsButton({
    required Color backgroundColor}) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      minimumSize: Size(350, 60),
      shadowColor: Colors.black,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
  
}

class TextStyles{
  static TextStyle elevatedButtonText({required Color color}){
    return GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle primaryHeader(){
    return GoogleFonts.openSans(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryBlack,
    );
  }

  static TextStyle primaryText(){
    return GoogleFonts.openSans(
      fontSize: 14,
      color: AppColors.primaryBlack,
    );
  }

}