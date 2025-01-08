import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';

class FollowingButton extends StatelessWidget {

  const FollowingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){

      },
      child: Row(
        children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.asset(
            'assets/icons/followed_check.png',
            height: 16,
            width: 16,
          ),
        ),
        Text('Following', style: TextStyles.elevatedButtonText(color: AppColors.primaryGray10FollowButton)),

        ]
      ),
    style: ButtonStyles.followButton(color: AppColors.primaryGray10FollowButton)
    );
  }
}
