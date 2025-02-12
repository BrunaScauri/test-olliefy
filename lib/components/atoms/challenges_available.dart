import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class ChallengesAvailable extends StatelessWidget {

  const ChallengesAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 88,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.bannerYellow,
            AppColors.bannerGreen,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 28, bottom: 24, top: 24),
        child: Row(
          children: [
            Image.asset(
              'assets/map_page/icons/challenges_banner_icon.png',
              width: 32,
              height: 32,
            ),
            SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '10 challenges available',
                  style: TextsStyles.profileDataBold(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Win prizes and money by skating.',
                  style: TextsStyles.smallText(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ]
            ),
          ]
        )
      )
    );
  }
}
