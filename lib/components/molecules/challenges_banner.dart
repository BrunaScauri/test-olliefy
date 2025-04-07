import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/colors.dart';

import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';
import 'package:test_olliefy/components/atoms/join_the_challenge_button.dart';

class ChallengesBanner extends StatelessWidget {
  final String imagePath;
  final String profileName;
  final String challengeName;
  final String challengeSponsor;
  final String challengeDescription;
  final String challengePrize;

  const ChallengesBanner({
    Key? key,
    required this.imagePath,
    required this.profileName,
    required this.challengeName,
    required this.challengeSponsor,
    required this.challengeDescription,
    required this.challengePrize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: AppColors.primaryWhite,
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                  child: Image.asset(
                    'assets/map_page/challenges/challenge_banner_1.jpeg', 
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 12,
                  bottom: 12,
                  child: Row(
                    children: [
                      ProfilePicture(borderWidth: 50.0, borderHeight: 50.0, imageWidth: 46, imageHeight: 46, imageHorizontalPadding: 2, imageVerticalPadding: 2, imagePath: imagePath, imageFit: BoxFit.scaleDown),
                      SizedBox(width: 18),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            challengeName,
                            style: ChallengesStyles.challengeNameBanner(),
                          ),
                          RichText(
                            text:TextSpan(
                              children: [
                                TextSpan(text:'Sponsored by ', style: ChallengesStyles.challengeText()),
                                TextSpan(text: challengeSponsor, style: ChallengesStyles.sponsorName()),
                              ]
                            )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Challenge Description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    challengeDescription,
                    style: TextsStyles.settingsSubtitle(),
                  ),
                  SizedBox(height: 8),
                  Text(
                    challengePrize,
                    style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  SizedBox(height: 8),
                  JoinTheChallengeButton(),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
