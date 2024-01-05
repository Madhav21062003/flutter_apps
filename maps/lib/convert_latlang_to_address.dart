import 'package:flutter/material.dart';

import 'package:geocoding/geocoding.dart';

class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({super.key});

  @override
  State<ConvertLatLangToAddress> createState() => _ConvertLatLangToAddressState();
}

class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {

  String placeM = '' ;
  String country = '' ;
  String state = '' ;
  String district = '' ;
  String colony = '' ;

  String addressOnScreen = '';
  late double latitude, longitude ;

  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.orange, Colors.teal, ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(child: Text('Enter Coordinates', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),)),
            const Center(child: Text('and Convert it into Addresses',style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),)),
              const SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10),
              child: TextField(
                controller: latitudeController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Latitude'),
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10),
              child: TextField(
                controller: longitudeController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Longitude'),
              ),
            ),


            Text("Country name = $country"),
            const SizedBox(height: 15,),
            Text("State name = $state"),
            const SizedBox(height: 15,),
            Text("Disctrict  name = $district"),
            const SizedBox(height: 15,),


            // Text("Latitudes and Longitudes = $addressOnScreen"),
            // const SizedBox(height: 15,),



            GestureDetector(

              // Converting Coordinates to Addresses
              onTap: () async{
                latitude = double.tryParse(latitudeController.text.toString()) ?? 0.0;
                longitude = double.tryParse(longitudeController.text.toString()) ?? 0.0;
                List<Placemark> placemark = await placemarkFromCoordinates(latitude, longitude);
                // List<Placemark> placemark = await placemarkFromCoordinates(33.738045, 73.084488);
                List<Location> location = await locationFromAddress('India, Aligarh');

                setState(() {

                  if (placemark.isNotEmpty) {
                    setState(() {
                      country = placemark.first.country ?? '';
                      state = placemark.first.administrativeArea ?? '';
                      district = placemark.first.locality ?? '';
                      colony = placemark.first.subLocality ?? '';

                    });
                  }

                  // addressOnScreen = '$latitude, $longitude';
                  // // placeM = '${placemark.reversed.last.country} ' ' ${placemark.reversed.last.locality} ' ' ${placemark.reversed.last.subLocality}';
                  // country = '${placemark.reversed.last.country}';
                  // state = '${placemark.reversed.last.administrativeArea}';
                  // district = '${placemark.reversed.last.locality}';
                  // colony = '${placemark.reversed.last.subLocality}';
                  //
                  // addressOnScreen  = '${location.last.latitude} ' ' ${location.last.longitude}';

                });
              },

              child: Padding(padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent
                  ),
                  child: const Center(
                    child: Center(child: Text('Hit to convert Coordinates to Address')),
                  ),
                ),
              ),
              ),
            )
          ],
        ),
      ) ,
    );
  }
}




/*
return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
        centerTitle: true
        ,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          InkWell(
            onTap: ()async{
              try {
                final  coordinates =new Coordinates(27.9031679 , 78.0996478);
                var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
                var first = address.first;
                print("Address ${first.featureName} ${first.addressLine}");
              } catch (error) {
                print("Error: $error");
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green
                ),
                child: Center(
                  child: Text('Convert'),
                ),
              ),
            ),
          )
        ],
      ),
    );
 */