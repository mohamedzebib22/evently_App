import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {

  ThemeMode appTheme =ThemeMode.light;

  void changedTheme(ThemeMode newTheme){
    if(appTheme == newTheme){
      return;
    }
    appTheme =newTheme;
    notifyListeners();
  }
}