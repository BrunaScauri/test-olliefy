import 'package:flutter/material.dart';

import 'package:test_olliefy/components/molecules/bottom_sheet_header.dart';
import 'package:test_olliefy/components/atoms/main_confirm_button.dart';
import 'package:test_olliefy/components/molecules/create_page/filter_button_multiple_choice.dart';

class PostObstaclesBottomSheet extends StatefulWidget {
  @override
  _PostObstaclesBottomSheetState createState() => _PostObstaclesBottomSheetState();
}

class _PostObstaclesBottomSheetState extends State<PostObstaclesBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            BottomSheetHeader(title: 'OBSTACLES'),
            SizedBox(height: 38),
            FilterButtonMultipleChoice(),
            SizedBox(height: 32),
            MainConfirmButton(title: 'Save', onTap: () => {Navigator.pop(context)}),
          ],
        ),
      ),
    );
  }
}