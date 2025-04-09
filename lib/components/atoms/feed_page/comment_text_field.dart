import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/fields.dart';

class CommentTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          onChanged: (value) {},
          decoration: FormDecorations.textFieldDecoration(
            labelText: 'Write a comment',
            textColor: AppColors.primaryGray5,
          ),
        ),
        Positioned(
          right: 10.0,
          top: 4.25,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 8.0),
            child: Icon(
              Icons.arrow_circle_right,
              color: AppColors.primaryGray5,
            ),
          ),
        ),
      ],
    );
  }
}