import 'package:flutter/material.dart';

class AppTheme {

  static final ThemeData ligtTheme = ThemeData(
    primaryColor: Colors.blue,
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 24,
    ),
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
      
      //selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
     
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,

    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Color(0xff101127),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 24,
    ),
    scaffoldBackgroundColor: Color(0xff101127),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      
      //selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
    ),
     floatingActionButtonTheme: FloatingActionButtonThemeData(
      
      backgroundColor:Color(0xff101127),
      
    )
  );
}