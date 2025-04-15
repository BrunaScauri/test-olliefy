import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';

import 'package:test_olliefy/components/molecules/feed_page/video_player.dart';
import 'package:test_olliefy/components/molecules/create_page/capture_actions.dart';
import 'package:test_olliefy/components/molecules/create_page/pre_recording_sidebar_actions.dart';
import 'package:test_olliefy/components/molecules/create_page/post_recording_sidebar_actions.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> with TickerProviderStateMixin {
  late PageController _pageViewController;

  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryGold60FollowButton,
      appBar: AppBar(
        leadingWidth: 40.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppColors.primaryWhite
        ),
      ),
      body: PageView(
        controller: _pageViewController,
        children: [
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: VideoPlayer(
                    videoUrl: 'asset:///assets/feed_page/example_videos/1.mp4'
                  ),
                ),
                // PreRecordingSidebarActions(),
                PostRecordingSidebarActions(),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
