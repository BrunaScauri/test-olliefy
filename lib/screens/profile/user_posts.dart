import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';

import 'package:test_olliefy/screens/main_screen.dart';

class UserPosts extends StatefulWidget {
  @override
  _UserPostsState createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column (
          children: [
            Padding(
            padding: const EdgeInsets.all(15.0),
              child: Container(
                constraints: BoxConstraints(maxWidth: 370),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  style: ButtonStyles.socialsButton(
                    backgroundColor: AppColors.primaryWhite,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyles.elevatedButtonText(color: AppColors.primaryGray50),
                          children: [
                            TextSpan(text: 'User Posts'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ),
          ]
        )
      )
    );
  }
}