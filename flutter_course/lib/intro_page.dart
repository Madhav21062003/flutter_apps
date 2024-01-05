import 'package:flutter/material.dart';
import 'package:flutter_course/main.dart';

class IntroPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Intrp Page'),
      ),
      body: Column(
        children: [
          Text('Welcome to Intro Page'),
            SizedBox(height: 15,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyHomePage();
            },));
          }, child: Text('Next'),)
        ],
      ),
    );
  }

}