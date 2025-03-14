import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide ClusterManager;
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart' hide Cluster; 
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart' as cluster_manager;
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/cluster_icon_generator.dart';

import 'package:test_olliefy/screens/map/main_bottom_sheet.dart';
import 'package:test_olliefy/components/molecules/filter_button_row.dart';
import 'package:test_olliefy/screens/map/map_pointers.dart';
import 'package:test_olliefy/screens/map/map_style.dart';
import 'package:test_olliefy/screens/map/location_details.dart';
import 'package:test_olliefy/screens/map/place.dart';
import 'package:test_olliefy/screens/map/heatmap_overlay.dart';
import 'package:test_olliefy/screens/map/heatmap_cluster.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;    
  final String styleSheet = MapData.style;
  final GlobalKey _mapKey = GlobalKey();
  double _currentZoom = 11.0;

  final LatLng _center = const LatLng(41.31513013789628, 2.1658136248462085);
  final List<Place> places = HeatmapData.barcelonaPlaces;
  Set<Marker> markers = {};
  late cluster_manager.ClusterManager<Place> _clusterManager;

  bool _showPersistentSheet = true;
  List<Offset> _heatmapOffsets = [];

  //load, resize and return first frame as png byte data
  Future<BitmapDescriptor> getResizedMarker(String assetPath, int targetWidth) async {
    final ByteData data = await rootBundle.load(assetPath);
    final ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: targetWidth,
    );
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ByteData? bytes = await frameInfo.image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }

  //marker builder
  Future<Marker> _markerBuilder(cluster_manager.Cluster<Place> cluster) async {
    BitmapDescriptor icon;
    if(cluster.isMultiple) {
      icon = await getClusterBitmap(cluster.count);
    } else {
      final place = cluster.items.first;
      switch (place.type) {
        case 'bowl':
          icon = await getResizedMarker('assets/map_page/markers/bowl_marker.png', 100);
          break;
        case 'halfpipe':
          icon = await getResizedMarker('assets/map_page/markers/halfpipe_marker.png', 100);
          break;
        case 'rail':
          icon = await getResizedMarker('assets/map_page/markers/rails_marker.png', 100);
          break;
        case 'ramp':
          icon = await getResizedMarker('assets/map_page/markers/ramp_marker.png', 100);
          break;
        case 'stairs':
          icon = await getResizedMarker('assets/map_page/markers/stairs_marker.png', 100);
          break;
        case 'userLocation':
          icon = await getResizedMarker('assets/map_page/markers/stairs_marker.png', 100);
          break;
        default:
          icon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
      }
    }
    return Marker(
      markerId: MarkerId(cluster.getId()),
      position: cluster.location,
      icon: icon,
      onTap: () {
        if (cluster.isMultiple) {
          mapController.animateCamera(CameraUpdate.newLatLngZoom(cluster.location, 14));
        } else {
          final place = cluster.items.first;
          // LocationDetails(place: place);
        }
      },
    );
  }

  List<HeatmapCluster> getHeatmapClusters(List<Offset> offsets, double zoom) {
  const double farthestZoom = 11.0;
  if (zoom > farthestZoom) {
    return [HeatmapCluster(points: offsets)];
    } else {
      const double clusterThreshold = 50.0;
      return clusterOffsets(offsets, clusterThreshold);
    }
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
    _currentZoom = position.zoom;
    if (position.zoom <= 4.0) {
      _clusterManager.updateMap();
    } else {
      _clusterManager.setItems(places);
    }
  }

  void _onCameraIdle() {
    _clusterManager.updateMap();
    _updateHeatmap();
  }

  void _updateHeatmap() async {
    if (_mapKey.currentContext == null) return;
  
    // get the map container's global position
    final RenderBox mapBox = _mapKey.currentContext!.findRenderObject() as RenderBox;
    final Offset mapGlobalPos = mapBox.localToGlobal(Offset.zero);

    // get the device's pixel ratio
    final double pixelRatio = MediaQuery.of(_mapKey.currentContext!).devicePixelRatio;

    List<Offset> offsets = [];
    for (Place place in places) {
      final screenCoord = await mapController.getScreenCoordinate(place.coordinate);
      //convert physical pixels to logical pixels.
      final Offset globalOffset = Offset(screenCoord.x.toDouble(), screenCoord.y.toDouble()) / pixelRatio;
      // get the map container's position also in logical pixels.
      final Offset mapLogicalPos = mapGlobalPos / pixelRatio;
      // compute the offset relative to the map container.
      final Offset relativeOffset = globalOffset - mapLogicalPos;
      offsets.add(relativeOffset);
      print("Place ${place.name} - Global: $globalOffset, MapPos: $mapLogicalPos, Relative: $relativeOffset");
    }
    setState(() {
      _heatmapOffsets = offsets;
    });
  }

  double getDynamicRadius(double zoom) {
    const double maxRadius = 80.0;
    const double minRadius = 30.0;
    // normalize zoom between 4 and 11.
    double t = (zoom - 4) / (11 - 4);
    t = t.clamp(0.0, 1.0);
    //linear interpolation between maxRadius and minRadius.
    return maxRadius * (1 - t) + minRadius * t;
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
            key: _mapKey,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: markers,
              onCameraMove: _onCameraMove,
              onCameraIdle: _onCameraIdle,
            ),
          ),
          HeatmapOverlay(
            offsets: _heatmapOffsets,
            zoom: _currentZoom,
            baseRadius: getDynamicRadius(_currentZoom),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 64),
            child: FilterButtonRow(searchButton: true),
          ),
          if (_showPersistentSheet) MainBottomSheet(),
        ],
      ),
    );
  }
}