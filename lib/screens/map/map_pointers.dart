import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_olliefy/screens/map/place.dart';

class HeatmapData {
  static final List<Place> barcelonaPlaces = [
    Place(coordinate: LatLng(41.3851, 2.1734), name: 'Barcelona City Center', type: 'bowl'),
    Place(coordinate: LatLng(41.3874, 2.1686), name: 'Near La Rambla', type: 'halfpipe'),
    Place(coordinate: LatLng(41.3902, 2.1547), name: 'Gothic Quarter', type: 'ramp'),
    Place(coordinate: LatLng(41.3947, 2.1603), name: 'Arc de Triomf', type: 'rail'),
    Place(coordinate: LatLng(41.4036, 2.1744), name: 'Park Güell', type: 'stairs'),
    Place(coordinate: LatLng(41.3809, 2.1228), name: 'Montjuïc', type: 'userLocation'),
    Place(coordinate: LatLng(41.3948, 2.1487), name: 'El Born', type: 'bowl'),
    Place(coordinate: LatLng(41.3984, 2.1917), name: 'Sagrada Família', type: 'stairs'),
    Place(coordinate: LatLng(41.4022, 2.1991), name: 'Hospital de Sant Pau', type: 'ramp'),
    Place(coordinate: LatLng(41.3669, 2.1499), name: 'Port Vell', type: 'userLocation'),
  ];
}
