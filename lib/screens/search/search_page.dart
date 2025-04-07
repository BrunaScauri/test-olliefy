import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';

import 'package:test_olliefy/screens/search/search_page_content.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
          initialChildSize: 1, //for testing
          minChildSize: 0.8,
          maxChildSize: 1,
          expand: true,
          snap: true,
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
                child: SearchPageContent(scrollController: scrollController),
              ),
            );
          },
        );
      },
    );
  }
}