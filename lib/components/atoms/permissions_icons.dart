import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class ProfileName extends StatelessWidget {
  final String imagePath;

  const ProfileName({
    Key? key,
    this.imagePath = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        imagePath,
        colorFilter: const ColorFilter.mode(AppColors.primaryBlack, BlendMode.srcIn),
        height: 15,
      )
    );
  }
}
