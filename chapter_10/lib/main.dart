// ignore_for_file: unused_import

import 'package:chapter_10/GetApis/example_five.dart';
import 'package:chapter_10/GetApis/example_three.dart';
import 'package:chapter_10/GetApis/example_two.dart';
import 'package:chapter_10/GetApis/example_four.dart';
import 'package:chapter_10/GetApis/home_screen.dart';
import 'package:chapter_10/PostApis/sign_up.dart';
import 'package:chapter_10/PostApis/upload_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UploadImageScreen(),
    );
  }
}
