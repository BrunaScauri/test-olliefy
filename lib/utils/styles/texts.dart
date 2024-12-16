import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TextsStyles{
  static TextStyle termsAndConditionsBold(){
    return TextStyle(
      color: Color.fromRGBO(134, 118, 32, 1),
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle profileDataBold(){
    return TextStyle(
      color: AppColors.primaryBlack,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle profileData(){
    return TextStyle(
      color: AppColors.primaryGray30,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle profileDescription(){
    return TextStyle(
      color: AppColors.primaryBlack,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle profileHyperlink(){
    return TextStyle(
      color: AppColors.primaryBlack,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }
}