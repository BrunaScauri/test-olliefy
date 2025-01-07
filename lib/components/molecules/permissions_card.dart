import 'package:flutter/material.dart';
import 'package:test_olliefy/components/atoms/permissions_icons.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class PermissionsCard extends StatelessWidget {
  final String imagePath;
  final String permissionName;

  const PermissionsCard({
    Key? key,
    required this.imagePath,
    required this.permissionName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PermissionsIcons(imagePath: imagePath),
        SizedBox(width: 16),
        RichText(
        text:TextSpan(style: TextsStyles.profileDescription(), children: [
          TextSpan(text: permissionName),
          ])
        ),
      ]
    );
  }
}