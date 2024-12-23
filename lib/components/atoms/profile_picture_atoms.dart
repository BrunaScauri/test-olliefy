import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';

class ProfilePictureAtoms { //used on posts only the picture and the border is used on the locations 
  static customPictureBorder({
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGray30,
            spreadRadius: -8,
            blurRadius: 15.0,
            offset: Offset(5, 10),
          )
        ]
      ),
    );
  }

  static customPicture({
    required double width,
    required double height,
    required double horizontalPadding,
    required double verticalPadding,
    required String imagePath,
    imageFit = BoxFit.fill,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: imageFit,
          ),
        ),
      ),
    );
  }
}
