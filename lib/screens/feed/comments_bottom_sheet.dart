import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/components/atoms/drag_bar.dart';
import 'package:test_olliefy/components/atoms/feed_page/comment_text_field.dart';
import 'package:test_olliefy/components/molecules/feed_page/comment_template.dart';

class CommentsBottomSheet extends StatefulWidget {
  @override
  _CommentsBottomSheetState createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            DragBar(),
            SizedBox(height: 8),
            //'log in' title 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '3 COMMENTS',
                  style: TextsStyles.spacedGray(),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  iconSize: 24,
                  color: AppColors.primaryGray30,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    children: [
                      CommentTemplate(),
                      CommentTemplate(),
                    ],
                  )
                ),
              ]
            ),
            CommentTextField(),
            SizedBox(height: 32),
          ]
        ),
      )
    );
  }
}