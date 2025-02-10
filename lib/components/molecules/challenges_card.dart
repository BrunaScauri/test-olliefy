import 'package:flutter/material.dart';
import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class ChallengesCard extends StatelessWidget {
  final String imagePath;
  final String profileName;
  final String challengeName;
  final String activityDate;

  const ChallengesCard({
    Key? key,
    required this.imagePath,
    required this.profileName,
    required this.challengeName,
    required this.activityDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 370),
      child: Row(
        children: [
          ProfilePicture(borderWidth: 40.0, borderHeight: 40.0, imageWidth: 36.8, imageHeight: 36.8, imageHorizontalPadding: 1.6, imageVerticalPadding: 1.6, imagePath: imagePath, imageFit: BoxFit.scaleDown),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: profileName,
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: ' created a new challenge: ',
                          style: TextsStyles.profileDescription(),
                        ),
                        TextSpan(
                          text: '$challengeName.',
                          style: TextsStyles.profileHyperlink(),
                        ),
                      ],
                    ),
                  )
                ]
              ),
              Text(activityDate)
            ]
          )
        ]
      )
    );
  }
}
