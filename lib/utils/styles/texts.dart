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

  static TextStyle profileDataBolder(){
    return TextStyle(
      color: AppColors.primaryBlack,
      fontSize: 16,
      fontWeight: FontWeight.w800,
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

  static TextStyle settingsSubtitle(){
    return TextStyle(
      color: AppColors.primaryBlack,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle sponsorDate(){
    return TextStyle(
    color: AppColors.primaryGray30,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    );
  }

  static TextStyle sponsorSubscription({
    required Color color,
  }){
    return TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    );
  }
}

class UserNotifsStyles{
  static TextStyle activity(){
    return TextStyle(
    color: AppColors.primaryBlack,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    );
  }

  static TextStyle activityItem(){
    return TextStyle(
    color: AppColors.primaryBlack,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    );
  }

  static TextStyle activityDate(){
    return TextStyle(
    color: AppColors.primaryGray30,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    );
  }

}

class UserStoreStyles{
  static TextStyle itemPrice(){
    return TextStyle(
    overflow: TextOverflow.ellipsis,
    color: AppColors.primaryBlack,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    );
  }
  static TextStyle itemDescription(){
    return TextStyle(
    overflow: TextOverflow.ellipsis,
    color: AppColors.primaryBlack,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    );
  }
}