import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_olliefy/utils/colors.dart';

class PermissionsIcons extends StatelessWidget {
  final String imagePath;

  const PermissionsIcons({
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
