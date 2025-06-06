import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

void showSuccessSnackbar(
  BuildContext context, {
    required String label,
  }) {
  final snackBar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: FeedStyles.videoDescription()),
        IconButton(
          icon: Icon(Icons.close),
          color: AppColors.primaryWhite,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 180, right: 20, left: 20),
    backgroundColor: AppColors.snackbarColor,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}