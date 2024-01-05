
import 'package:chaptereleven/utils/routes.dart';
import 'package:chaptereleven/utils/routes_names.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      // home: const HomeScreen(),

      // Now we use Routes going to one screen to another screen
      //

     initialRoute: RouteName.screenOne,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

