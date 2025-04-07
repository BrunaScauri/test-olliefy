import 'package:flutter/material.dart';
import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';
import 'package:test_olliefy/utils/styles/texts.dart';


class SkateboardingRecentlyCard extends StatelessWidget {
  final String imagePath;
  final String profileName;
  final String timestamp;

  const SkateboardingRecentlyCard({
    Key? key,
    required this.imagePath,
    required this.profileName,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          ProfilePicture(borderWidth: 40.0, borderHeight: 40.0, imageWidth: 36.8, imageHeight: 36.8, imageHorizontalPadding: 1.6, imageVerticalPadding: 1.6, imagePath: imagePath),
          SizedBox(width: 9.6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text(profileName, style: TextsStyles.sponsorDate()),
              Text(timestamp, style: TextsStyles.profileData()),
            ]
          )
        ]
      )
    );
  }
}
