import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';

import 'package:test_olliefy/screens/main_screen.dart';

class UserStore extends StatefulWidget {
  @override
  _UserStoreState createState() => _UserStoreState();
}

class _UserStoreState extends State<UserStore> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column (
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Container(
                constraints: BoxConstraints(maxWidth: 370),
                child: OutlinedButton(
                  onPressed: () {
                  },
                  style: ButtonStyles.marketplaceButton(
                    backgroundColor: AppColors.primaryWhite,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: AppColors.primaryGray50,
                        size: 20,
                      ),
                      SizedBox(width: 2),
                      RichText(
                        text: TextSpan(
                          style: TextStyles.elevatedButtonText(color: AppColors.primaryGray50),
                          children: [
                            TextSpan(text: 'Sell in the marketplace'),
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
