import 'package:flutter/material.dart';


class ThemeChanger with ChangeNotifier {
  var _ThemeMode = ThemeMode.light;
  get  themeMode=> _ThemeMode;



  void setTheme(themeMode){
    _ThemeMode = themeMode;
    notifyListeners();

  }




}