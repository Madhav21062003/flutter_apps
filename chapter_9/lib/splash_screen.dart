import 'dart:async';

import 'package:chapter_9/home_screen.dart';
import 'package:chapter_9/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  // init state runs before screen is calls which user want to see
  void initState() {
    // TODO: implement initState
    super.initState();
      isLogin();
  }

  void isLogin() async{
    SharedPreferences sp = await SharedPreferences.getInstance();

   bool isLogin =  sp.getBool('isLogin') ?? false;
   if(isLogin){
     Timer(Duration(seconds: 3), () {
       Navigator.push(
           context, MaterialPageRoute(builder: (context) => HomeScreen(), maintainState: false));
     });
   }

   else{
     Timer(Duration(seconds: 3), () {
       Navigator.push(
           context, MaterialPageRoute(builder: (context) => LoginScreen(), maintainState: false));
     });
   }
  }

  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      body: Image.asset(
        'assets/images/avtar.png',
        height: double.infinity,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
