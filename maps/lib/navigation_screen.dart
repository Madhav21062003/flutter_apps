import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/convert_latlang_to_address.dart';
import 'package:maps/custom_marker_info_window.dart';
import 'package:maps/custom_marker_screen.dart';
import 'package:maps/home_screen.dart';
import 'package:maps/plygone_screen.dart';
import 'package:maps/polyline.dart';
import 'package:maps/style_googlemap_screen.dart';

import 'get_user_location.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
appBar: AppBar(
  backgroundColor: Colors.red,
  title: Text('Google Map In Flutter', style: TextStyle(fontSize: 20),) ,
),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Center(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Use diffrent Applications ', style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),),
            )),

            Center(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('of Google Map', style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),),
            )),

            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
            }, child: const Text('HomeScreen')),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ConvertLatLangToAddress()));
            }, child: const Text('Covert Coordinates to actual address')),

            SizedBox(height: 20,),


            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomMarkerInfoWindowScreen()));
            }, child: const Text('Custom Marker Info Window')),

            SizedBox(height: 20,),


            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const CustomMarkerScreen()));
            }, child: const Text('See Custom Marker on Map ')),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const CurrentLocationScreen()));
            }, child: const Text('See Your Current Location ')),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const PolygoneScreen()));
            }, child: const Text('See Polygon on Map ')),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const PolylineScreen()));
            }, child: const Text('See Polyline on Map ')),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const StyleGoogleMapScreen()));
            }, child: const Text('Customize your google Map ')),


          ],
        ),
      ),
    );
    
  }
}
