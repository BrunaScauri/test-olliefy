import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TextsStyles{
  static TextStyle blackSemiboldLarge(){
    return GoogleFonts.openSans(
      color: AppColors.primaryBlack,
      fontWeight: FontWeight.w700,
      fontSize: 24,
    );
  }

  static TextStyle mainSubtitleNormal(){
    return GoogleFonts.openSans(
      color: AppColors.primaryBlack,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      // textAlign: textAlign,
    );
  }

  static TextStyle termsAndConditionsBold(){
    return GoogleFonts.openSans(
      color: AppColors.primaryGold70,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle profileDataBold(){
    return GoogleFonts.openSans(
      color: AppColors.primaryBlack,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle profileDataBolder(){
    return GoogleFonts.openSans(
      color: AppColors.primaryBlack,
      fontSize: 16,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle profileData(){
    return GoogleFonts.openSans(
      color: AppColors.primaryGray30,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle profileDescription(){
    return GoogleFonts.openSans(
      color: AppColors.primaryBlack,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle profileHyperlink(){
    return GoogleFonts.openSans(
      color: AppColors.primaryBlack,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle settingsSubtitle(){
    return GoogleFonts.openSans(
      color: AppColors.primaryBlack,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle sponsorDate(){
    return GoogleFonts.openSans(
    color: AppColors.primaryGray30,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    );
  }

  static TextStyle sponsorSubscription({
    required Color color,
  }){
    return GoogleFonts.openSans(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    );
  }
  
  static TextStyle spacedGray(){
    return GoogleFonts.openSans(
    color: AppColors.primaryGray30,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 3.0,
    );
  }

  static TextStyle heading2Bold(){
    return GoogleFonts.openSans(
      color: AppColors.primaryBlack,
      fontWeight: FontWeight.w700,
      fontSize: 32,
    );
  }

  static TextStyle smallText(){
    return GoogleFonts.openSans(
    color: AppColors.primaryBlack,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    );
  }
}

class UserNotifsStyles{
  static TextStyle activity(){
    return GoogleFonts.openSans(
    color: AppColors.primaryBlack,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    );
  }

  static TextStyle activityItem(){
    return GoogleFonts.openSans(
    color: AppColors.primaryBlack,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    );
  }

  static TextStyle activityDate(){
    return GoogleFonts.openSans(
    color: AppColors.primaryGray30,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    );
  }

}

class UserStoreStyles{
  static TextStyle itemPrice(){
    return GoogleFonts.openSans(
    color: AppColors.primaryBlack,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    );
    overflow: TextOverflow.ellipsis;
  }
  static TextStyle itemDescription(){
    return GoogleFonts.openSans(
    color: AppColors.primaryBlack,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    );
    overflow: TextOverflow.ellipsis;
  }
}

class AppBarStyles{
  static TextStyle appBarLabel(){
    return GoogleFonts.openSans(
      color: AppColors.primaryBlack,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle appBarLabelSelected({
    Color? color = AppColors.tabIconSelected,
  }){
    return GoogleFonts.openSans(
      color: color,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    );
  }
}