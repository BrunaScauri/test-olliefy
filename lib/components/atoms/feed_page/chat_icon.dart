import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/screens/feed/comments_bottom_sheet.dart';

class ChatIcon extends StatefulWidget {
  const ChatIcon({Key? key}) : super(key: key);

  @override
  State<ChatIcon> createState() => _ChatIconState();
}

class _ChatIconState extends State<ChatIcon> {
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
                _isTapped = true;
                showModalBottomSheet<dynamic>(
                  isScrollControlled: true,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  builder: (BuildContext context) {
                    return Wrap(
                      children: [
                        CommentsBottomSheet(),
                      ],
                    );
                  },
                ).whenComplete(() {
                  setState(() {
                    _isTapped = false;
                  });
                });
              });
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    _isTapped
                    ? 'assets/feed_page/icons/chat_icon_tapped.png'
                    : 'assets/feed_page/icons/chat_icon.png',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text('3', style: _isTapped ? FeedStyles.iconTextTapped() : FeedStyles.iconText()),
        ]
      )
    );
  }
}