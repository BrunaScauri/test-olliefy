import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';

class ShareIcon extends StatelessWidget {
  const ShareIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {

            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/feed_page/icons/share_icon.png',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text('4', style: FeedStyles.iconText()),
        ]
      )
    );
  }
}