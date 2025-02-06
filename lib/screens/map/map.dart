import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:test_olliefy/utils/colors.dart';

import 'package:test_olliefy/screens/map/location_bottom_sheet.dart';
import 'package:test_olliefy/components/molecules/filter_button_row.dart';
import 'package:test_olliefy/screens/map/map_pointers.dart';
import 'package:test_olliefy/screens/map/map_style.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  late GoogleMapController mapController;    
  final LatLng _center = const LatLng(41.38717210733345, 2.1701155937147556);
  final String styleSheet = MapData.style;

  final List<LatLng> heatmapPoints = HeatmapData.barcelonaHeatmapPoints;

  Set<Marker> _createMarkers() {
    return heatmapPoints.map((point) {
      return Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(title: 'Location', snippet: 'Lat: ${point.latitude}, Lng: ${point.longitude}'),
      );
    }).toSet();
  }

  Set<Circle> _createHeatmapCircles() {
    return heatmapPoints.map((point) {
      return Circle(
        circleId: CircleId(point.toString()),
        center: point,
        radius: 500,
        fillColor: Colors.red.withOpacity(0.5),
        strokeWidth: 0,
      );
    }).toSet();
  }

  void _setMapStyle() async {
    await mapController!.setMapStyle(styleSheet);
  }


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _setMapStyle();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 64),
            child: FilterButtonRow(searchButton: true),
          ),
          Container(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: _createMarkers(),
              circles: _createHeatmapCircles(),
            ),
          ),
          LocationBottomSheet(),
        ],
      )  
    );
  }
}
