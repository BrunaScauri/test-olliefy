import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_olliefy/utils/colors.dart';

class PostVideo extends StatelessWidget {
  final String imagePath;

  const PostVideo({
    Key? key,
    required this.imagePath,

  }) : super(key: key);

  final videoIcon = 'assets/profile_page/icons/video_icon.svg';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 290,
          width: 163,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: AppColors.primaryGray5,
              width: 1.0,
            ),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 10.25,
          right: 10.25,
          child: SvgPicture.asset(
            videoIcon,
            width: 19.5,
            height: 19.5,
          ),
        ),
      ]
    );
  }
}


