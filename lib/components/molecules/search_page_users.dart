import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';

class SearchPageUsers extends StatelessWidget {
  final String imagePath;
  final String profileName;

  const SearchPageUsers({
    Key? key,
    required this.imagePath,
    required this.profileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          ProfilePicture(borderWidth: 40.0, borderHeight: 40.0, imageWidth: 36.8, imageHeight: 36.8, imageHorizontalPadding: 1.6, imageVerticalPadding: 1.6, imagePath: imagePath),
          SizedBox(width: 9.6),
          Text(profileName, style: TextsStyles.sponsorDate()),
        ]
      )
    );
  }
}
