// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:mvvm_pattern/utils/routes/routes.dart';
import 'package:mvvm_pattern/utils/routes/routes_names.dart';

import 'package:mvvm_pattern/view/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
