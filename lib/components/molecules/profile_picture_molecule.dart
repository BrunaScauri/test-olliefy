import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/colors.dart';

class ProfilePicture extends StatelessWidget {
  final double borderWidth;
  final double borderHeight;
  final double imageWidth;
  final double imageHeight;
  final double imageHorizontalPadding;
  final double imageVerticalPadding;
  final String imagePath;
  final BoxFit imageFit;

  const ProfilePicture({
    Key? key,
    required this.borderWidth,
    required this.borderHeight,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageHorizontalPadding,
    required this.imageVerticalPadding,
    this.imagePath = '',
    this.imageFit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: borderWidth,
          height: borderHeight,
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryGray30,
                spreadRadius: -8,
                blurRadius: 15.0,
                offset: Offset(5, 10),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: imageHorizontalPadding,
            vertical: imageVerticalPadding,
          ),
          child: Container(
            width: imageWidth,
            height: imageHeight,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: imageFit,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
