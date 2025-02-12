import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class JoinTheChallengeButton extends StatelessWidget {

  const JoinTheChallengeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGold60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      ),
      onPressed: () {
      },
      icon: Image.asset('assets/map_page/icons/join_challenge_icon.png'),
      label: Text(
        "Join the challenge",
        style: ChallengesStyles.joinTheChallengeText(),
      ),
    );
  }
}
