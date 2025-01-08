import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';

class FollowButton extends StatelessWidget {

  const FollowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){

      },
      child: RichText(
        text:TextSpan(style: TextStyles.elevatedButtonText(color: AppColors.primaryGold70),
          children: [
            TextSpan(text:'Follow'),
          ]
        )
      ),
    style: ButtonStyles.followButton(color: AppColors.primaryGold60FollowButton)
    );
  }
}
