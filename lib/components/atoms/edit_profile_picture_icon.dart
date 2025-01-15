import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:test_olliefy/utils/colors.dart';

class EditProfilePictureIcon extends StatelessWidget {

  const EditProfilePictureIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppColors.primaryGold60,
        ),
        width: 50,
        height: 50,
        child: Center(
          child: SvgPicture.asset(
            'assets/profile_page/icons/edit_profile_picture_icon.svg',
            width: 19.5,
            height: 19.5,
          ),
        ),
      )
    );
  }
}
