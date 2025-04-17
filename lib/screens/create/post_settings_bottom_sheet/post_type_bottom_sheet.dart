import 'package:flutter/material.dart';

import 'package:test_olliefy/components/atoms/create_page/settings_option.dart';
import 'package:test_olliefy/components/molecules/bottom_sheet_header.dart';
import 'package:test_olliefy/components/atoms/main_confirm_button.dart';

class PostTypeBottomSheet extends StatefulWidget {
  @override
  _PostTypeBottomSheetState createState() => _PostTypeBottomSheetState();
}

class _PostTypeBottomSheetState extends State<PostTypeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            BottomSheetHeader(title: 'TYPE'),
            SizedBox(height: 38),
            SettingsOption(
              icon: 'assets/create_page/icons/post_settings_icons/post_type_events_icon.png',
              title: 'Posts',
              description: 'Upload content into a spot',
              onTap: () {
                // Handle option tap
              },
            ),
            SizedBox(height: 24),
            SettingsOption(
              icon: 'assets/create_page/icons/post_settings_icons/post_type_posts_icon.png',
              title: 'Events',
              description: 'The post will be promoted as an event.',
              onTap: () {
                // Handle option tap
              },
            ),
            SizedBox(height: 48),
            MainConfirmButton(title: 'Save', onTap: () => {Navigator.pop(context)}),
          ],
        ),
      ),
    );
  }
}