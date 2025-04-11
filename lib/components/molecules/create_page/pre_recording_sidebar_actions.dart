import 'package:flutter/material.dart';

import 'package:test_olliefy/components/atoms/create_page/sidebar_action_icon.dart';

class PreRecordingSidebarActions extends StatelessWidget {
  const PreRecordingSidebarActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      top: 0,
      right: 16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // Handle camera icon tap
            },
            child: SidebarActionIcon(text: 'Camera', imagePath: 'assets/create_page/icons/switch_camera_icon.png'),
          ),
          GestureDetector(
            onTap: () {
              // Handle flash icon tap
            },
            child: SidebarActionIcon(text: 'Flash', imagePath: 'assets/create_page/icons/flash_icon.png'),
          ),
          GestureDetector(
            onTap: () {
              // Handle timer icon tap
            },
            child: SidebarActionIcon(text: 'Timer', imagePath: 'assets/create_page/icons/timer_icon.png'),
          ),
        ]
      )
    );
  }
}