import 'package:flutter/material.dart';

import 'package:test_olliefy/components/atoms/create_page/settings_option.dart';
import 'package:test_olliefy/components/molecules/bottom_sheet_header.dart';

class PostVisibilityBottomSheet extends StatefulWidget {
  @override
  _PostVisibilityBottomSheetState createState() => _PostVisibilityBottomSheetState();
}

class _PostVisibilityBottomSheetState extends State<PostVisibilityBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            BottomSheetHeader(title: 'VISIBILITY'),
            SizedBox(height: 38),
            SettingsOption(
              icon: 'assets/create_page/icons/post_settings_icons/post_visibility_public_icon.png',
              title: 'Public',
              description: 'It will appear on the Map and in the Feed.',
              onTap: () {
                // Handle public option tap
              },
            ),
            SizedBox(height: 24),
            SettingsOption(
              icon: 'assets/create_page/icons/post_settings_icons/post_visibility_private_icon.png',
              title: 'Private',
              description: 'It will be saved in your spots',
              onTap: () {
                // Handle private option tap
              },
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}