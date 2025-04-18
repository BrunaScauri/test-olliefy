import 'package:flutter/material.dart';

import 'package:test_olliefy/components/molecules/bottom_sheet_header.dart';
import 'package:test_olliefy/components/atoms/main_confirm_button.dart';
import 'package:test_olliefy/components/atoms/main_grey_button.dart';
import 'package:test_olliefy/components/atoms/main_text_field.dart';

class PostDescriptionBottomSheet extends StatefulWidget {
  @override
  _PostDescriptionBottomSheetState createState() => _PostDescriptionBottomSheetState();
}

class _PostDescriptionBottomSheetState extends State<PostDescriptionBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            BottomSheetHeader(title: 'DESCRIPTION'),
            SizedBox(height: 38),
            MainTextField(label: 'Write a description...', initialSize: 4),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainConfirmButton(title: 'Save', onTap: () => {Navigator.pop(context)}, minimumSize: Size(MediaQuery.of(context).size.width * 1 / 2 - 17, 60),),
                MainGreyButton(title: 'Delete', onTap: () => {Navigator.pop(context)}, minimumSize: Size(MediaQuery.of(context).size.width * 1 / 2 - 17, 60)),
              ]
            )
          ],
        ),
      ),
    );
  }
}