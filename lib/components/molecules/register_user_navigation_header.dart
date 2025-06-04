import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';

import 'package:test_olliefy/utils/route/slide_outgoing_down.dart';
import 'package:test_olliefy/utils/route/slide_outgoing_right.dart';

class RegisterUserNavigationHeader extends StatelessWidget {
  final Widget backButtonEnterPage;
  final Widget backButtonExitPage;
  final Widget closeButtonEnterPage;
  final Widget closeButtonExitPage;

  const RegisterUserNavigationHeader({
    super.key, 
    required this.backButtonEnterPage, 
    required this.backButtonExitPage,
    required this.closeButtonEnterPage,
    required this.closeButtonExitPage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryWhite,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.west),
              iconSize: 24,
              onPressed: () {
                  Navigator.of(context).push(
                    slideOutgoingRight(
                      enterPage: backButtonEnterPage, exitPage: backButtonExitPage,
                    ),
                );
              }
            ),
            IconButton(
              icon: Icon(Icons.close),
              iconSize: 24,
              onPressed: () {
                Navigator.of(context).push(
                  slideOutgoingDown(
                    enterPage: closeButtonEnterPage, exitPage: closeButtonExitPage,
                  ),
                );
              }
            ),
          ]
        )
      )
    );
  }
}