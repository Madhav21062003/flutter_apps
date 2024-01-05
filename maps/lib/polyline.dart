import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineScreen extends StatefulWidget {
  const PolylineScreen({super.key});

  @override
  State<PolylineScreen> createState() => _PolylineScreenState();
}

class _PolylineScreenState extends State<PolylineScreen> {

  // Step -1 Create a completer og Google map
  Completer<GoogleMapController> _contoller = Completer();

  CameraPosition _kGooglePlex  = CameraPosition(target: LatLng(33.654235, 73.073000),
    zoom: 14,
  );


  final Set<Marker> _marker = {} ;
  final Set<Polyline> _polyline = {};

  List<LatLng> latlng = [
    LatLng(33.654235, 73.073000),
    LatLng(33.64736, 72.820175),
    LatLng(33.689531, 72.763160),
    LatLng(34.131452, 72.662334),
    LatLng(33.654235, 73.073000),
    LatLng(33.68531, 72.7660),
    LatLng(34.1352, 72.6334),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(int i=0; i<latlng.length; i++){
      _marker.add(
        Marker(
            markerId: MarkerId(i.toString()),
          position: latlng[i],
          infoWindow: InfoWindow(
            title: "Really cool place",
            snippet: '5 star rating',
          ),
          icon: BitmapDescriptor.defaultMarker,
        )
      );

      setState(() {

      });
    }

    _polyline.add(
      Polyline(polylineId: PolylineId('1'),
      points: latlng,
        color: Colors.orange
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polyline'),
        centerTitle: true,
      ),

      body: SafeArea(
        child: GoogleMap(initialCameraPosition: _kGooglePlex,
        myLocationButtonEnabled: true,
          mapType: MapType.normal,
          markers: _marker,
          polylines: _polyline,
          onMapCreated: (GoogleMapController controller){
          _contoller.complete(controller);

          },
        ),
      ),
    );
  }
}
