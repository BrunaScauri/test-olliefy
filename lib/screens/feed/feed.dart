import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';

import 'package:test_olliefy/components/molecules/feed_page/sidebar_actions.dart';
import 'package:test_olliefy/components/molecules/feed_page/post_metadata.dart';
import 'package:test_olliefy/components/molecules/feed_page/video_player.dart';
import 'package:test_olliefy/screens/app_tab.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with TickerProviderStateMixin {
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
      appBar: AppBar(
        leadingWidth: 40.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => AppTab(initialIndex: 0),
              ),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppColors.primaryWhite
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: IconButton(
              icon: ImageIcon(
                AssetImage('assets/feed_page/icons/search_icon.png'),
              ),
              onPressed: () {
              },
            ),
          )
        ],
      ),
      body: PageView(
        controller: _pageViewController,
        scrollDirection: Axis.vertical,
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
                SidebarActions(),
                PostMetadata(),
              ]
            )
          ),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: VideoPlayer(
                    videoUrl: 'asset:///assets/feed_page/example_videos/2.mp4'
                  ),
                ),
                SidebarActions(),
                PostMetadata(),
              ]
            ),
          ),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: VideoPlayer(
                    videoUrl: 'asset:///assets/feed_page/example_videos/3.mp4'
                  ),
                ),
                SidebarActions(),
                PostMetadata(),
              ]
            ),
          ),
        ],
      ),
    );
  }
}