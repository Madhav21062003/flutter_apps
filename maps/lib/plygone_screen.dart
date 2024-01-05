import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygoneScreen extends StatefulWidget {
  const PolygoneScreen({super.key});

  @override
  State<PolygoneScreen> createState() => _PolygoneScreenState();
}

class _PolygoneScreenState extends State<PolygoneScreen> {

  // Step -1 make a controller
  final Completer<GoogleMapController> _controller = Completer();

  // step -2 set the initial camera position
  CameraPosition _kGooglePlex = CameraPosition(
    target:LatLng(33.654235, 73.073000),
    zoom: 14,
  );

  // make use of markers
  final Set<Marker> markers = {};

  Set<Polygon> _ploygone = HashSet<Polygon>();

  List<LatLng> points = [
    LatLng(33.654235, 73.073000),
    LatLng(33.64736, 72.820175),
    LatLng(33.689531, 72.763160),
    LatLng(34.131452, 72.662334),
    LatLng(33.654235, 73.073000),

  ] ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ploygone.add(
      Polygon(polygonId: PolygonId('1'), points: points,
      fillColor: Colors.red.withOpacity(0.3),
      strokeWidth: 4,
          strokeColor: Colors.deepOrange
      )
    ) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polygone Screen '),
      ),
      body: SafeArea(
        child:
         GoogleMap(
           initialCameraPosition: _kGooglePlex,
           mapType: MapType.normal,
           zoomControlsEnabled: true,
           myLocationButtonEnabled: true,
           myLocationEnabled: false,
           polygons: _ploygone,
           markers: Set<Marker>.of(markers),
           onMapCreated: (GoogleMapController controller){
             _controller.complete(controller);
           },

         )

      ),
    );
  }
}
