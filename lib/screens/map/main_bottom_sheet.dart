import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/fields.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/screens/map/main_bottom_sheet_content.dart';

class MainBottomSheet extends StatefulWidget {
  @override
  _MainBottomSheetState createState() => _MainBottomSheetState();
}

class _MainBottomSheetState extends State<MainBottomSheet> {
  final _sheet = GlobalKey();
  final DraggableScrollableController _controller = DraggableScrollableController();

 @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  DraggableScrollableSheet get sheet => (_sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DraggableScrollableSheet(
          key: _sheet,
          controller: _controller,
          initialChildSize: 0.6,
          minChildSize: 0.2,
          maxChildSize: 1,
          expand: true,
          snap: true,
          snapSizes: [
            0.2,
            0.6,
          ],
          builder: (BuildContext context, ScrollController scrollController){
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onVerticalDragUpdate: (details) {
                _controller.animateTo(
                  (_controller.size + details.primaryDelta! / constraints.maxHeight).clamp(
                    sheet.minChildSize, 
                    sheet.maxChildSize,
                  ),
                  duration: const Duration(milliseconds: 1),
                  curve: Curves.linear,
                );
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.boxShadow,
                      offset: Offset(0, -3),
                      blurRadius: 11.9,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: MainBottomSheetContent(scrollController: scrollController),
              ),
            );
          },
        );
      },
    );
  }
}