import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';

class LocationCondition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/map_page/icons/good_condition_icon.png',
              ),
            ),
          ),
        ),
        SizedBox(width: 6),
        Text('Good Condition', style: TextsStyles.sponsorDate()),
      ]
    );
  }
}