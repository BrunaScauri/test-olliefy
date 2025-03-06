import 'package:flutter/material.dart';

import 'package:test_olliefy/screens/map/heatmap_cluster.dart';
import 'package:test_olliefy/screens/map/heatmap_painter.dart';

class HeatmapOverlay extends StatelessWidget {
  final List<Offset> offsets;
  final double zoom;
  final double baseRadius;

  const HeatmapOverlay({
    Key? key,
    required this.offsets,
    required this.zoom,
    this.baseRadius = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: HeatmapPainter(
          points: offsets,
          baseRadius: baseRadius,
          clusterThreshold: 50.0,
        ),
        size: MediaQuery.of(context).size,
      ),
    );
  }
}
