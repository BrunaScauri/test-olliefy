import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonStyles {
  static ButtonStyle elevatedButtonEnabled (){
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryGold60,
      minimumSize: Size(350, 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0.0,
      shadowColor: Colors.transparent,
    );
  }
  static ButtonStyle elevatedButtonDisabled (){
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.buttonDisabled12,
      minimumSize: Size(350, 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0.0,
      shadowColor: Colors.transparent,
    );
  }
  
  static TextStyle elevatedButtonTextEnabled (){
    return GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryBlack,
    );
  }

  static TextStyle elevatedButtonTextDisabled (){
    return GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryGray50,
    );
  }
}