import 'dart:async';

import 'package:covidtracker/view/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(duration: const Duration(seconds: 3), vsync: this,)..repeat();
  @override

  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  void initState() {
    super.initState();
    // Simulate a delay for demonstration purposes
    Future.delayed(const Duration(seconds: 2), () {
      // After the delay, navigate to the next screen
      navigateToNextScreen();
    });
  }

  void navigateToNextScreen() {
    // Replace the splash screen with the new screen
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => WorldStatesScreen(), // Replace with your desired screen
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          AnimatedBuilder(animation: _controller,
              child: Container(
                height: 200,
                width: 200,
                child: const Center(
                  child: Image(image: AssetImage('images/virus.png')),
                ),
              ),
              builder: (BuildContext context, Widget? child){
            return Transform.rotate(
              angle: _controller.value * 2.0 * math.pi,
              child: child,
            );
          }),

          SizedBox(height: MediaQuery.of(context).size.height* 0.08,),
          const Align(
            alignment: Alignment.center,
            child: Text('Covid-19\n Tracker App',textAlign: TextAlign.center, style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30
            ),),
          ),

        ],
      )),
    );

  }
}
