import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class SpotLocation extends StatelessWidget {
  final String location;

  const SpotLocation({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppColors.feedSpotLocation,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/feed_page/icons/spot_icon.png',
                  ),
                ),
              ),
              height: 16,
              width: 16,
            ),
            SizedBox(width: 8),
            Text(location, style: ChallengesStyles.challengeText()),

          ]
        )
      ),
    );
  }
}