import 'package:google_maps_flutter/google_maps_flutter.dart' hide ClusterManager;
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart' as cluster_manager;

class Place with cluster_manager.ClusterItem {
  final LatLng coordinate;
  final String name;
  final String type;

  Place({required this.coordinate, required this.name, required this.type});

  @override
  LatLng get location => coordinate;
}
