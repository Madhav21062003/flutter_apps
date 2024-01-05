import 'package:chaptereleven/home_screen.dart';
import 'package:flutter/material.dart';


class ScreenThree extends StatefulWidget {
  static const String id = 'screen_three' ;

  final String name ;
  int num ;

   ScreenThree({super.key, required this.name, required this.num});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.name.toString()+" "+ widget.num.toString())),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            InkWell(
              onTap: (){
                print('hello');
              },
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Center(child: Text('Screen 3')),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
