import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/components/atoms/drag_bar.dart';

class BottomSheetHeader extends StatelessWidget {
  final String title;

  const BottomSheetHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        DragBar(),
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
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
        ),
      ],
    );
  }
}