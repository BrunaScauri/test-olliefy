import 'package:flutter/material.dart';
import 'package:test_olliefy/screens/app_tab.dart';

import 'package:test_olliefy/utils/colors.dart';

import 'package:test_olliefy/components/molecules/feed_page/video_player.dart';
import 'package:test_olliefy/components/molecules/create_page/pre_recording_sidebar_actions.dart';
import 'package:test_olliefy/components/molecules/create_page/capture_actions.dart';
import 'package:test_olliefy/components/molecules/create_page/post_recording_sidebar_actions.dart';
import 'package:test_olliefy/components/molecules/create_page/post_actions.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> with TickerProviderStateMixin {
  late PageController _pageViewController;
  bool _isRecording = false;

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
      backgroundColor: AppColors.primaryBlack,
      appBar: AppBar(
        leadingWidth: 40.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => AppTab(initialIndex: 1),
              ),
            );
          },
        ),
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
                
                Center(
                  child: ElevatedButton(
                    child: Text('Toggle between modes'),
                    onPressed:() => setState(() {
                      _isRecording = !_isRecording;
                    }),
                  ),
                ),
                ...(_isRecording ? [
                  PostRecordingSidebarActions(),
                  Positioned(
                    right: 0,
                    left: 0,
                    top: MediaQuery.of(context).size.height - 200,
                    bottom: 0,
                    child: PostActions(),
                  ),
                ]
                : [
                  PreRecordingSidebarActions(),
                  Positioned(
                    right: 0,
                    left: 0,
                    top: MediaQuery.of(context).size.height - 130,
                    bottom: 0,
                    child: CaptureActions(),
                  ),
                ]),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
