import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class GooglePlacesApiScreen extends StatefulWidget {
  const GooglePlacesApiScreen({super.key});

  @override
  State<GooglePlacesApiScreen> createState() => _GooglePlacesApiScreenState();
}

class _GooglePlacesApiScreenState extends State<GooglePlacesApiScreen> {

  // Manages input data send by the user
  TextEditingController _controller = TextEditingController();

  // uuid helps to get device id
  var uuid = Uuid();
  String _sessionToken = '12234';

    List<dynamic> _placesList = [] ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }

  void onChange(){
    if(_sessionToken == null){
      setState(() {
        _sessionToken = uuid.v4() ;
      });
    }
    getSuggestion(_controller.text);
  }

 void getSuggestion(String input )async{
      String kPlACES_API_Key = "AIzaSyC582VXRDdCI5UReZUyGRo40-eIipB7jxM";
      String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request = '$baseURL?input=$input&key=$kPlACES_API_Key&sessiontoken=$_sessionToken';

      var response = await http.get(Uri.parse(request));

      print(response.body.toString());
      if(response.statusCode == 200){
            setState(() {
              _placesList = jsonDecode(response.body.toString()) ['predictions'];
            });
      }else{
        throw Exception('Failed to load data') ;
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Places Api'),
        centerTitle: true,
      ),

      body:   Padding(
        padding: EdgeInsets.symmetric( vertical: 12.0),
        child: Column(
          children: [

            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search Places With name'
              ),


            ),
            
            Expanded(child: ListView.builder(
              itemCount: _placesList.length,
                itemBuilder: (context, index){
                    return ListTile(
                      onTap: () async {
                        List<Location> locations = await locationFromAddress(_placesList[index]['description']);
                        
                        print(locations.last.longitude);
                        print(locations.last.latitude);

                      },
                      title: Text(_placesList[index]['description']),
                    );
                }))
          ],
        ),
      ),
    );
  }
}
