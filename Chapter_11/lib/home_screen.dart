import 'package:chaptereleven/screen_two.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {

  static const String id = 'home_screen' ;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Navigation and Routing')),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            InkWell(

              // Normal Method of Screen Routing
              onTap: (){
                // Switching SCreen through the method of Routing
                Navigator.pushNamed(context, ScreenTwo.id, arguments: {
                  'name' : "Madhav",
                  'num' : 25,
                });

                // Navigator.push(context,
                // MaterialPageRoute(builder: (context) => ScreenTwo(name: 'Madhav Solanki', num: 22,))
                // );
              },


              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Center(child: Text('Screen 1')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
