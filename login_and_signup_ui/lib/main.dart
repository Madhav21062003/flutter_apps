

import 'package:flutter/material.dart';
import 'package:login_and_signup_ui/login.dart';
import 'package:login_and_signup_ui/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    // we have to define routes
    // first we show the login screen to the user so we set it as initial route

    initialRoute: 'login',
      routes: {
      'login': (context) => MyLogin(),
        'register': (context) => MyRegister(),
      },
  ));
}

