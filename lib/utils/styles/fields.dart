import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';

class FormDecorations {
  static InputDecoration textFieldDecoration({
    String? labelText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Widget? prefixIconWidget,
    Widget? suffixIconWidget,
    EdgeInsetsGeometry? contentPadding,
    Color? textColor = AppColors.primaryGray10,
    Color? iconColor = AppColors.primaryBlack,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryGray10,
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryGold70,
          width: 2.0,
        ),
      ),
      labelText: labelText,
      contentPadding: contentPadding ?? EdgeInsets.all(16),
      labelStyle: TextStyle(
        color: textColor,
        fontSize: 16,
      ),
      floatingLabelStyle: TextStyle(
        color: AppColors.primaryGold70,
      ),
      suffixIcon: suffixIconWidget != null
      ? Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: suffixIconWidget,
        )
        : suffixIcon != null ? Icon(suffixIcon, color: iconColor) : null,
      prefixIcon: prefixIconWidget != null 
        ? Padding(
          padding: EdgeInsets.all(11.0),
          child: prefixIconWidget,
        )
        : prefixIcon != null ? Icon(prefixIcon, color: iconColor) : null,
    );
  }
}
