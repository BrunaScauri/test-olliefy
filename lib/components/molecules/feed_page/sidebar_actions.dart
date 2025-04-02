import 'package:flutter/material.dart';

import 'package:test_olliefy/components/atoms/feed_page/cheer_icon.dart';
import 'package:test_olliefy/components/atoms/feed_page/chat_icon.dart';
import 'package:test_olliefy/components/atoms/feed_page/share_icon.dart';
import 'package:test_olliefy/components/atoms/feed_page/favorite_icon.dart';

class SidebarActions extends StatelessWidget {
  const SidebarActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      top: 0,
      right: 16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CheerIcon(),
          ChatIcon(),
          ShareIcon(),
          FavoriteIcon(),
        ]
      )
    );
  }
}