import 'package:flutter/material.dart';
import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';
import 'package:test_olliefy/components/atoms/profile_name.dart';
import 'package:test_olliefy/components/atoms/sponsor_date.dart';

class UserList extends StatelessWidget {
  final String imagePath;
  final String profileName;

  const UserList({
    Key? key,
    required this.imagePath,
    required this.profileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ProfilePicture(borderWidth: 40.0, borderHeight: 40.0, imageWidth: 36.0, imageHeight: 36.0, imageHorizontalPadding: 1.6, imageVerticalPadding: 1.6, imagePath: imagePath),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SponsorDate(sponsorDate: profileName),
            ]
          )
        ]
      )
    );
  }
}
