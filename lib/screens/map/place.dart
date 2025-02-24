import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  final LatLng coordinate;
  final String name;

  Place({required this.coordinate, required this.name});
}
