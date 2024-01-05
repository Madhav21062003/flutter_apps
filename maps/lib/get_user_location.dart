import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {

  // Stores users address
  String address = '';

  // A Completer to hold the GoogleMapController
  final Completer<GoogleMapController> _controller = Completer();

  // Function to get the user's current location
  Future<Position> _getUserCurrentLocation() async {

    // Request permission to access location
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });

    // Retrieve the current position
    return await Geolocator.getCurrentPosition();
  }

  // List of markers to display on the map
  final List<Marker> _markers = <Marker>[];

  // Initial camera position for the Google Map
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.6844, 73.0479),
    zoom: 14,
  );


  // List of predefined markers
  List<Marker> list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.6844, 73.0479),
        infoWindow: InfoWindow(title: 'some Info ')),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Add the predefined markers to the list of markers
    _markers.addAll(list);
    //loadData();
  }

  // Function to load user's location data
  loadData() {
    _getUserCurrentLocation().then((value) async {

      // Add a new marker for the user's current position
      _markers.add(Marker(
          markerId: const MarkerId('SomeId'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(title: address)));

      // Retrieve the GoogleMapController from the Completer
      final GoogleMapController controller = await _controller.future;

      // Create a new CameraPosition for the user's current location
      CameraPosition _kGooglePlex = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );

      // Move the camera to the new position
      controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));

      // update the ui
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: Text('Flutter Google Map'),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [

            // Google Map Widget
            GoogleMap(
              initialCameraPosition: _kGooglePlex,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: Set<Marker>.of(_markers),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),

            // UI overlay
            Container(
              height: MediaQuery.of(context).size.height * .2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {

                      // Get user's current location again when the button is tapped
                      _getUserCurrentLocation().then((value) async {

                        // Add a new marker for the updated current position
                        _markers.add(Marker(
                            markerId: const MarkerId('SomeId'),
                            position: LatLng(value.latitude, value.longitude),
                            infoWindow: InfoWindow(title: address)));
                        final GoogleMapController controller =
                            await _controller.future;

                        // Create a new CameraPosition for the updated location
                        CameraPosition _kGooglePlex = CameraPosition(
                          target: LatLng(value.latitude, value.longitude),
                          zoom: 14,
                        );

                        // Move the camera to the updated position
                        controller.animateCamera(
                            CameraUpdate.newCameraPosition(_kGooglePlex));

                        // Get the address details using geocoding
                        List<Placemark> placemarks =
                            await placemarkFromCoordinates(
                                value.latitude, value.longitude);

                        final add = placemarks.first;

                        // Construct the address string
                        address = add.locality.toString() +
                            " " +
                            add.administrativeArea.toString() +
                            " " +
                            add.subAdministrativeArea.toString() +
                            " " +
                            add.country.toString();

                        setState(() {});
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          'Current Location',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(address),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
