import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';

class CheerIcon extends StatefulWidget {
  const CheerIcon({Key? key}) : super(key: key);

  @override
  State<CheerIcon> createState() => _CheerIconState();
}

class _CheerIconState extends State<CheerIcon> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isTapped = !_isTapped;
              });
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    _isTapped
                    ? 'assets/feed_page/icons/cheer_icon_tapped.png'
                    : 'assets/feed_page/icons/cheer_icon.png',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text('13', style: _isTapped ? FeedStyles.iconTextTapped() : FeedStyles.iconText()),
        ]
      )
    );
  }
}