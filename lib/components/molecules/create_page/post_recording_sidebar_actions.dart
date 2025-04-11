import 'package:flutter/material.dart';

import 'package:test_olliefy/components/atoms/create_page/sidebar_action_icon.dart';

class PostRecordingSidebarActions extends StatelessWidget {
  const PostRecordingSidebarActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      top: 0,
      right: 14,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // Handle vis icon tap
            },
            child: SidebarActionIcon(text: 'Public', imagePath: 'assets/create_page/icons/post_visibility_icon.png'),
          ),
          GestureDetector(
            onTap: () {
              // Handle type icon tap
            },
            child: SidebarActionIcon(text: 'Type', imagePath: 'assets/create_page/icons/type_icon.png'),
          ),
          GestureDetector(
            onTap: () {
              // Handle obstacles icon tap
            },
            child: SidebarActionIcon(text: 'Obstacles', imagePath: 'assets/create_page/icons/obstacles_icon.png'),
          ),
          GestureDetector(
            onTap: () {
              // Handle description icon tap
            },
            child: SidebarActionIcon(text: 'Description', imagePath: 'assets/create_page/icons/description_icon.png'),
          ),
          GestureDetector(
            onTap: () {
              // Handle save icon tap
            },
            child: SidebarActionIcon(text: 'Save', imagePath: 'assets/create_page/icons/save_icon.png'),
          ),
        ]
      )
    );
  }
}