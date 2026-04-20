import 'package:evently/core/utils/shared_prefrences_helper.dart';
import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  ThemeMode currentTheme =
      sharedPrefsHelper.sharedPreferences.getString('theme') ==
          'ThemeMode.light'
      ? ThemeMode.light
      : ThemeMode.dark;

  String currentLanguage =
      sharedPrefsHelper.sharedPreferences.getString('language') ?? 'en';

  bool get isDarkTheme => currentTheme == ThemeMode.dark;

  void changeTheme(ThemeMode theme) {
    if (currentTheme == theme) return;
    currentTheme = theme;
    sharedPrefsHelper.sharedPreferences.setString('theme', theme.toString());
    notifyListeners();
  }

  void changeLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    sharedPrefsHelper.sharedPreferences.setString('language', newLanguage);
    notifyListeners();
  }
}
