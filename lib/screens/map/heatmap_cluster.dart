import 'package:flutter/material.dart';

import 'package:test_olliefy/screens/map/heatmap_overlay.dart';

class HeatmapCluster {
  final List<Offset> points;
  HeatmapCluster({required this.points});

  Offset get center {
    double sumX = 0;
    double sumY = 0;
    for (final p in points) {
      sumX += p.dx;
      sumY += p.dy;
    }
    return Offset(sumX / points.length, sumY / points.length);
  }

  int get count => points.length;

  void add(Offset point) => points.add(point);
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
