import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {

  String appLanguage = 'en';

  void changeLanguage(String newLanguageSelected){
    if(appLanguage == newLanguageSelected){
      return;
    }
    appLanguage =newLanguageSelected;
    notifyListeners();
  }
  
}