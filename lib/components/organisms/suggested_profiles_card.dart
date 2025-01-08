import 'package:flutter/material.dart';
import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';
import 'package:test_olliefy/components/atoms/profile_name.dart';
import 'package:test_olliefy/components/atoms/follow_button.dart';
import 'package:test_olliefy/components/atoms/following_button.dart';

class SuggestedProfileCard extends StatelessWidget {
  final String profileName;
  final double borderWidth;
  final double borderHeight;
  final double imageWidth;
  final double imageHeight;
  final double imageHorizontalPadding;
  final double imageVerticalPadding;
  final String imagePath;
  final BoxFit imageFit;

  const SuggestedProfileCard({
    Key? key,
    this.profileName = 'aaaaaa',
    this.borderWidth = 50.0,
    this.borderHeight = 50.0,
    this.imageWidth = 46.0,
    this.imageHeight = 46.0,
    this.imageHorizontalPadding = 2.0,
    this.imageVerticalPadding = 2.0,
    this.imagePath = '',
    this.imageFit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ProfilePicture(borderWidth: borderWidth, borderHeight: borderHeight, imageWidth: imageWidth, imageHeight: imageHeight, imageHorizontalPadding: imageHorizontalPadding, imageVerticalPadding: imageVerticalPadding, imagePath: imagePath),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
              child: ProfileName(profileName: profileName),
            ),
          ]
        ),
      ]  
    );
  }
}
