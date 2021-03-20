import 'dart:typed_data';

import 'package:custom_map_marker/Markergenerator.dart';
import 'package:custom_map_marker/locations.dart';
import 'package:custom_map_marker/map_marker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(13.1896, 80.3039);
  List<MapMarker> mapMarkers = [];
  List<Marker> customMarkers = [];
  List<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps) {
    bitmaps.asMap().forEach((i, bmp) {
      customMarkers.add(Marker(
        markerId: MarkerId("$i"),
        position: locations[i].coordinates,
        icon: BitmapDescriptor.fromBytes(bmp),
      ));
    });
  }

  @override
  void initState() {
    MarkerGenerator(markerWidgets(), (bitmaps) {
      setState(() {
        mapBitmapsToMarkers(bitmaps);
      });
    }).generate(context);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: customMarkers.toSet(),
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 20.0,
        ),
      ),
    );
  }

  List<Widget> markerWidgets() {
    return locations.map((l) => MapMarker(l)).toList();
  }
}
