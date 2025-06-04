import 'package:flutter/material.dart';

import 'package:test_olliefy/screens/map/heatmap_cluster.dart';

class HeatmapPainter extends CustomPainter {
  final List<Offset> points;
  final double baseRadius;
  final double clusterThreshold;

  HeatmapPainter({
    required this.points,
    this.baseRadius = 50.0,
    this.clusterThreshold = 50.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final clusters = clusterOffsets(points, clusterThreshold);

    for (final cluster in clusters) {
      if (cluster.count == 1) {
        continue;
      }

      final center = cluster.center;
      final radius = baseRadius * (1 + (cluster.count - 1) * 0.3);

      final gradient = RadialGradient(
        colors: [
          Colors.red.withValues(alpha: 1.0),
          Colors.orange.withValues(alpha: 0.8),
          Colors.yellow.withValues(alpha: 0.6),
          Colors.green.withValues(alpha: 0.4),
          Colors.blue.withValues(alpha: 0.2),
          Colors.transparent,
        ],
        stops: const [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
      );

      final rect = Rect.fromCircle(center: center, radius: radius);
      final paint = Paint()
        ..shader = gradient.createShader(rect)
        ..blendMode = BlendMode.srcOver;

      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

List<HeatmapCluster> clusterOffsets(List<Offset> offsets, double threshold) {
  List<HeatmapCluster> clusters = [];
  for (final offset in offsets) {
    bool added = false;
    for (final cluster in clusters) {
      if ((cluster.center - offset).distance < threshold) {
        cluster.add(offset);
        added = true;
        break;
      }
    }
    if (!added) {
      clusters.add(HeatmapCluster(points: [offset]));
    }
  }
  return clusters;
}
