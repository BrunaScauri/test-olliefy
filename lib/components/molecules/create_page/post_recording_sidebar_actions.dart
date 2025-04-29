import 'package:flutter/material.dart';

import 'package:test_olliefy/components/atoms/create_page/sidebar_action_icon.dart';
import 'package:test_olliefy/components/atoms/create_page/success_snackbar.dart';
import 'package:test_olliefy/components/molecules/modal_bottom_sheet.dart';
import 'package:test_olliefy/screens/create/post_settings_bottom_sheet/post_visibility_bottom_sheet.dart';
import 'package:test_olliefy/screens/create/post_settings_bottom_sheet/post_type_bottom_sheet.dart';
import 'package:test_olliefy/screens/create/post_settings_bottom_sheet/post_obstacles_bottom_sheet.dart';
import 'package:test_olliefy/screens/create/post_settings_bottom_sheet/post_description_bottom_sheet.dart';

class PostRecordingSidebarActions extends StatelessWidget {
  const PostRecordingSidebarActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      top: 0,
      right: 16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ModalBottomSheet(onTap: () => PostVisibilityBottomSheet(), child: SidebarActionIcon(text: 'Public', imagePath: 'assets/create_page/icons/post_visibility_icon.png')),
          ModalBottomSheet(onTap: () => PostTypeBottomSheet(), child: SidebarActionIcon(text: 'Type', imagePath: 'assets/create_page/icons/type_icon.png')),
          ModalBottomSheet(onTap: () => PostObstaclesBottomSheet(), child: SidebarActionIcon(text: 'Obstacles', imagePath: 'assets/create_page/icons/obstacles_icon.png')),
          ModalBottomSheet(onTap: () => PostDescriptionBottomSheet(), child: SidebarActionIcon(text: 'Description', imagePath: 'assets/create_page/icons/description_icon.png')),
          GestureDetector(
            onTap: () => showSuccessSnackbar(
              context,
              label: 'Video saved successfully',
            ),
            child: SidebarActionIcon(
              text: 'Save',
              imagePath: 'assets/create_page/icons/save_icon.png',
            ),
          ),
        ]
      )
    );
  }
}