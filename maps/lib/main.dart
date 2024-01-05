import 'package:flutter/material.dart';
import 'package:maps/custom_marker_info_window.dart';
import 'package:maps/get_user_location.dart';
import 'package:maps/plygone_screen.dart';
import 'package:maps/polyline.dart';
import 'package:maps/style_googlemap_screen.dart';

import 'convert_latlang_to_address.dart';
import 'custom_marker_screen.dart';
import 'google_places_api.dart';
import 'navigation_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationScreen(),
    );
  }
}

