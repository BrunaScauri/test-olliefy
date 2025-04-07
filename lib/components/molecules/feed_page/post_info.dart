import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';

class PostInfo extends StatelessWidget {
  final String username;
  final String postTime;

  const PostInfo({
    Key? key,
    required this.username,
    required this.postTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfilePicture(borderWidth: 30.0, borderHeight: 30.0, imageWidth: 27.6, imageHeight: 27.6, imageHorizontalPadding: 1.2, imageVerticalPadding: 1.2, imagePath: 'assets/profile_page/icons/example_pfp/3.jpeg', imageFit: BoxFit.scaleDown),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(username, style: FeedStyles.profileName()),
            Text(postTime, style: FeedStyles.videoDate()),
          ]
        )
      ]
    );
  }
}