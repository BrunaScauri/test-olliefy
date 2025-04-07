import 'package:flutter/material.dart';

import 'package:test_olliefy/components/molecules/feed_page/sidebar_actions.dart';
import 'package:test_olliefy/components/molecules/feed_page/post_metadata.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;

  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 40.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppColors.primaryWhite
        ),
        actions: [
          IconButton(
            icon: ImageIcon(
              AssetImage('assets/feed_page/icons/search_icon.png'),
            ),
            onPressed: () {
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageViewController,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            color: Colors.blue,
            child: Stack(
              children: [
                Container(
                  color: Colors.blue,
                ),
                SidebarActions(),
                PostMetadata(),
              ]
            )
          ),
          Container(
            color: Colors.black,
            child: Center(
              child: Text(
                'Page 1',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Container(
            color: Colors.red,
            child: Center(
              child: Text(
                'Page 2',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}