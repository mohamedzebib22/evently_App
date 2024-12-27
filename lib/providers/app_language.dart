import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLanguage = 'en';

  AppLanguageProvider() {
    loadLangauge();
  }

  

  void changeLanguage(String newLanguageSelected) async {
    if (appLanguage == newLanguageSelected) {
      return;
    }
    appLanguage = newLanguageSelected;

    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', appLanguage);
    
  }
  loadLangauge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appLanguage = prefs.getString('lang') ?? 'en';

    notifyListeners();
  }
}
