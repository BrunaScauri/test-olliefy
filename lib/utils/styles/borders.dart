import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';

class CustomBorders{
  static profilePictureBorder({
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
}