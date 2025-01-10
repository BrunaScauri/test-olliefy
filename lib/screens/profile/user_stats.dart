import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';

import 'package:test_olliefy/screens/main_screen.dart';

class UserStats extends StatefulWidget {
  @override
  _UserStatsState createState() => _UserStatsState();
}

class _UserStatsState extends State<UserStats> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 48),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text('SETUP', style: TextsStyles.spacedGray()),
          
        ],
      ),
    );
  }
}
