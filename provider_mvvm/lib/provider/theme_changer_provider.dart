
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier{

  var _theme_mode = ThemeMode.light ;

  ThemeMode get themeMode =>_theme_mode ;

  void setTheme(themeMode){
      _theme_mode = themeMode ;
      notifyListeners();
  }
}