import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:test_olliefy/utils/colors.dart';

import 'package:test_olliefy/screens/main_screen.dart';
import 'package:test_olliefy/screens/map/location_bottom_sheet.dart';
import 'package:test_olliefy/components/molecules/filter_button_row.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {


  late GoogleMapController mapController;    
  final LatLng _center = const LatLng(-33.86, 151.20);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Stack(
        children: [
          // SizedBox(height: 400),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 64),
            child: FilterButtonRow(searchButton: true),
          ),
          // Container(
          //   child: GoogleMap(
          //     onMapCreated: _onMapCreated,
          //     initialCameraPosition: CameraPosition(
          //       target: _center,
          //       zoom: 11.0,
          //     ),
          //   ),
          // ),
          LocationBottomSheet(),
        ],
      )  
    );
  }
}
