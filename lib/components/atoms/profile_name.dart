import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class ProfileName extends StatelessWidget {
  final String profileName;

  const ProfileName({
    Key? key,
    this.profileName = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(profileName, style: TextsStyles.profileHyperlink()),
          
    );
  }
}
