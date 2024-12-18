import 'package:flutter/material.dart';

class AppTheme {

  static final ThemeData ligtTheme = ThemeData(
    primaryColor: Colors.blue,
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 24,
    ),
    
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      showSelectedLabels: true
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.blue,
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 24,
    ),
    scaffoldBackgroundColor: Color(0xff5669FF),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      showSelectedLabels: true
    )
  );
}