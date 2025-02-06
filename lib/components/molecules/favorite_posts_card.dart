import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/components/atoms/post_video.dart';
import 'package:test_olliefy/components/atoms/borderless_profile_picture.dart';

class FavoritePostsCard extends StatelessWidget {
  final String profileName;
  final String profilePicturePath;
  final String imagePath;

  const FavoritePostsCard({
    Key? key,

    required this.profileName,
    required this.profilePicturePath,
    required this.imagePath,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostVideo(imagePath: imagePath),
          SizedBox(height: 8),
          Text(
            'asaaa',
            style: TextsStyles.sponsorDate(),
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BorderlessProfilePicture(
                imageWidth: 22.08,
                imageHeight: 22.08,
              ),
              SizedBox(height: 4),
              Text(
                profileName,
                style: TextsStyles.postsProfileName(),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


