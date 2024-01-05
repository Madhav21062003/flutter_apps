import 'package:chapter_4/home_screen.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatefulWidget {

  // Routing in flutter
  static const String id = 'home_screen1' ;
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Navigation drawer'),
          backgroundColor: Colors.orangeAccent,
        ),

      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Center(
            child: TextButton(onPressed: (){
                // Navigator.pop(context);
              Navigator.pop(context, HomeScreen.id );
            }, child: Text('Screen 2 ')),
          )
        ]
      ),
    );
  }
}
