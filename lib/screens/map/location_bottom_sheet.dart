import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/fields.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/screens/map/location_bottom_sheet_content.dart';

class LocationBottomSheet extends StatefulWidget {
  @override
  _LocationBottomSheetState createState() => _LocationBottomSheetState();
}

class _LocationBottomSheetState extends State<LocationBottomSheet> {
  final _sheet = GlobalKey();
  final DraggableScrollableController _controller = DraggableScrollableController();

 @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onChanged() {
    final currentSize = _controller.size;
    if (currentSize <= 0.05) _collapse();
  }

  void _collapse() => _animateSheet(sheet.snapSizes!.first);
  void _anchor() => _animateSheet(sheet.snapSizes!.last);
  void _expand() => _animateSheet(sheet.maxChildSize);
  void _hide() => _animateSheet(sheet.minChildSize);

  void _animateSheet(double size) {
    _controller.animateTo(
      size,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  DraggableScrollableSheet get sheet => (_sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DraggableScrollableSheet(
          key: _sheet,
          controller: _controller,
          initialChildSize: 0.5,
          minChildSize: 0,
          maxChildSize: 1,
          expand: true,
          snap: true,
          snapSizes: [
            60 / constraints.maxHeight,
            0.5,
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
                child: LocationBottomSheetContent(scrollController: scrollController),
              ),
            );
          },
        );
      },
    );
  }
}