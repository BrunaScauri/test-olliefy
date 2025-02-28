import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide ClusterManager;
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart' hide Cluster; 
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart' as cluster_manager;

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/cluster_icon_generator.dart';

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
  late cluster_manager.ClusterManager<Place> _clusterManager;
  Set<Marker> markers = {};

  Future<Marker> _markerBuilder(cluster_manager.Cluster<Place> cluster) async {
  BitmapDescriptor icon = cluster.isMultiple
      ? await getClusterBitmap(cluster.count)
      : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);

  return Marker(
    markerId: MarkerId(cluster.getId()),
    position: cluster.location,
    icon: icon,
    onTap: () {
      if (cluster.isMultiple) {
        mapController.animateCamera(CameraUpdate.newLatLngZoom(cluster.location, 14));
      } else {
        final place = cluster.items.first;
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => MapDetailsPage(place: place),
        );
      }
    },
  );
}

  void _updateMarkers(Set<Marker> newMarkers) {
    setState(() {
      this.markers = newMarkers;
    });
  }

  void _setMapStyle() async {
    await mapController!.setMapStyle(styleSheet);
  }


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _setMapStyle();
    _clusterManager.setMapId(controller.mapId);
  }

  void _onCameraMove(CameraPosition position) {
  _clusterManager.onCameraMove(position);

  if (position.zoom <= 4.0) {
    _clusterManager.updateMap();
  } else {
    _clusterManager.setItems(places);
  }
}

  @override
  void initState() {
    super.initState();
    _clusterManager = cluster_manager.ClusterManager<Place>(
      places,
      _updateMarkers,
      markerBuilder: _markerBuilder,
    );
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
              markers: markers,
              onCameraMove: _onCameraMove,
              onCameraIdle: _clusterManager.updateMap,
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