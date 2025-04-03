import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';

class ShareIcon extends StatefulWidget {
  const ShareIcon({Key? key}) : super(key: key);

  @override
  State<ShareIcon> createState() => _ShareIconState();
}

class _ShareIconState extends State<ShareIcon> {
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
                    ? 'assets/feed_page/icons/share_icon_tapped.png'
                    : 'assets/feed_page/icons/share_icon.png',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text('444', style: _isTapped ? FeedStyles.iconTextTapped() : FeedStyles.iconText()),
        ]
      )
    );
  }
}