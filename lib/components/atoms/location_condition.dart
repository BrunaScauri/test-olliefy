import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';

class LocationCondition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(
          AssetImage('assets/map_page/icons/good_condition_icon.png'),
          size: 16,
        ),
        SizedBox(width: 6),
        Text('Good Condition', style: TextsStyles.sponsorDate()),
      ]
    );
  }
}