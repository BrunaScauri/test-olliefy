import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/modal/login_modal.dart';
import 'package:test_olliefy/screens/register_modal.dart';
import 'package:test_olliefy/utils/route/ease_incoming_in.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryGold60,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 450),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(flex: 5, child: Container()),
                SvgPicture.asset(
                  'assets/skateboard_only_logo.svg',
                  colorFilter: const ColorFilter.mode(AppColors.primaryBlack, BlendMode.srcIn),
                  height: 70,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                      'Get inspired, find spots, buy and sell.', style: TextsStyles.blackSemiboldLarge()
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Amplify your skateboarding experience by finding spots and what people is doing.\nIn real time, anywhere in the world.', style: TextsStyles.mainSubtitleNormal()
                      ),

                    ]
                  )
                ),
                ElevatedButton(
                  key: const Key('login_button'),
                  onPressed: () {
                    showModalBottomSheet<dynamic>(
                      isScrollControlled: true,
                      context: context,
                      //removed barrier color to prevent successSnackbar from appearing to be on another context.
                      barrierColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      builder: (BuildContext context) {
                        return Wrap(
                          children: [
                            LoginModal(),
                          ],
                        );
                      },
                    );
                  },
                  child: RichText(
                    text:TextSpan(style: TextStyles.elevatedButtonText(color: AppColors.primaryWhite), children: [
                      TextSpan(text:'Log in'),
                    ])
                  ),
                  style: ButtonStyles.elevatedButton(backgroundColor: AppColors.primaryBlack)
                ),
                SizedBox(height: 16),
                OutlinedButton(
                  key: const Key('register_button'),
                  onPressed: () {
                    Navigator.of(context).push(
                      easeIncomingIn(
                        RegisterModal(),
                      )
                    );
                  },
                  child: RichText(
                      text:TextSpan(style: TextStyles.elevatedButtonText(color: AppColors.primaryBlack), children: [
                        TextSpan(text:'Register'),
                      ])
                  ),
                  style: ButtonStyles.elevatedButton(backgroundColor: Colors.transparent)
                ),
                Flexible(flex: 2, child: Container()),
                Container(
                  constraints: BoxConstraints(maxWidth: 450),
                  child: Image.asset(
                    'assets/main_screen_image.png',
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}