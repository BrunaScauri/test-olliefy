import 'package:flutter/material.dart';
import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';
import 'package:test_olliefy/components/atoms/profile_name.dart';
import 'package:test_olliefy/components/atoms/sponsor_date.dart';

class SponsorCard extends StatelessWidget {
  final String imagePath;
  final String profileName;
  final String sponsorDate;

  const SponsorCard({
    Key? key,
    required this.imagePath,
    required this.profileName,
    required this.sponsorDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ProfilePicture(borderWidth: 50.0, borderHeight: 50.0, imageWidth: 46.0, imageHeight: 46.0, imageHorizontalPadding: 2.0, imageVerticalPadding: 2.0, imagePath: imagePath),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileName(profileName: profileName),
              SponsorDate(sponsorDate: sponsorDate),
            ]
          )
        ]
      )
    );
  }
}
