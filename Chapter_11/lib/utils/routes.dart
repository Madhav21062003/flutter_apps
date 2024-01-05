

import 'package:chaptereleven/professional_routing/screen_five.dart';
import 'package:chaptereleven/professional_routing/screen_four.dart';
import 'package:chaptereleven/professional_routing/screen_one.dart';
import 'package:chaptereleven/utils/routes_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){

      case RouteName.screenOne:
        return MaterialPageRoute(builder: (context) => ScreenOne());

      case RouteName.screenFour:
        return MaterialPageRoute(builder: (context) => ScreenFour());

      case RouteName.screenFive:
        return MaterialPageRoute(builder: (context) => ScreenFive());

      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Center(child: Text('No route found')),
          );
        });

    }
  }
}