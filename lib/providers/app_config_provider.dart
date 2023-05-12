import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {

  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.dark;
  void changeLang(String newLang) async{

 SharedPreferences   prefs = await SharedPreferences.getInstance();


    if (appLanguage == newLang) {

      return;
    }
    appLanguage = newLang;
   await prefs.setString('lang', appLanguage);
   
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) async{
 SharedPreferences   prefs = await SharedPreferences.getInstance();

    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
   await prefs.setString('theme',  newTheme==ThemeMode.light?  'light':'dark');

    notifyListeners();
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }
}
