import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:test_olliefy/utils/colors.dart';

class CustomProfileTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabIndicatorPainter();
  }
}

class _CustomTabIndicatorPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = AppColors.primaryGold70
      ..style = PaintingStyle.fill;

    final double width = configuration.size!.width; // Tab width
    final double height = configuration.size!.height; // Tab height

    // Define custom paddings for each tab
    double leftPadding = 0;
    double rightPadding = 0;

    // Example: Adjust padding based on the tab's position using offset.dx
    if (offset.dx == 0.0) {
      // First tab
      rightPadding = 10;
    } else if (offset.dx == width) {
      // Second tab
      leftPadding = 30;
      rightPadding = 10;
    } else {
      // Third tab (assuming three tabs)
      leftPadding = 20;
    }

    final double indicatorLeft = offset.dx + leftPadding;
    final double indicatorRight = offset.dx + width - rightPadding;
    final double indicatorTop = height - 4;
    final double indicatorBottom = height;

    // Draw the indicator
    canvas.drawRect(
      Rect.fromLTWH(
        indicatorLeft,
        indicatorTop,
        indicatorRight - indicatorLeft,
        indicatorBottom - indicatorTop,
      ),
      paint,
    );
  }
}