import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:test_olliefy/utils/colors.dart';

import 'package:test_olliefy/screens/map/location_bottom_sheet.dart';
import 'package:test_olliefy/components/molecules/filter_button_row.dart';
import 'package:test_olliefy/screens/map/map_pointers.dart';
import 'package:test_olliefy/screens/map/map_style.dart';
import 'package:test_olliefy/screens/map/map_details_page.dart';
import 'package:test_olliefy/screens/map/place.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;    
  final LatLng _center = const LatLng(41.31513013789628, 2.1658136248462085);
  final String styleSheet = MapData.style;
  final List<Place> places = HeatmapData.barcelonaPlaces;
  bool _showPersistentSheet = true;

  Set<Marker> _createMarkers() {
    return places.map((place) {
      return Marker(
        markerId: MarkerId(place.name),
        position: place.coordinate,
        infoWindow: InfoWindow.noText,
        onTap: () {
          if (_showPersistentSheet) {
            setState(() {
              _showPersistentSheet = false;
            });
          };
          showModalBottomSheet(
            context: context,
            barrierColor: Colors.transparent,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.4,
                maxChildSize: 1,
                expand: false,
                builder: (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: MapDetailsPage(place: place),
                    ),
                  );
                },
              );
            }
          );
        }
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
          Container(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: _createMarkers(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 64),
            child: FilterButtonRow(searchButton: true),
          ),
          if (_showPersistentSheet) LocationBottomSheet(),
        ],
      )  
    );
  }
}
