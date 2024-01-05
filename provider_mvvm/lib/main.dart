// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/provider/auth_provider.dart';
import 'package:provider_mvvm/provider/count_provider.dart';
import 'package:provider_mvvm/provider/exapmle_one_provider.dart';
import 'package:provider_mvvm/provider/favorite_provider.dart';
import 'package:provider_mvvm/provider/theme_changer_provider.dart';
import 'package:provider_mvvm/screen/count_example.dart';
import 'package:provider_mvvm/screen/dark_theme.dart';
import 'package:provider_mvvm/screen/example_one.dart';
import 'package:provider_mvvm/screen/favorite/favorite_screen.dart';
import 'package:provider_mvvm/screen/login.dart';
import 'package:provider_mvvm/statefull_widget_screen.dart';
import 'package:provider_mvvm/why_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(builder: (BuildContext context){
        final themeChanger = Provider.of<ThemeChangerProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.red
          ),


          home: LoginScreen(),
        );
      }),
    );
  }
}



/*


*/