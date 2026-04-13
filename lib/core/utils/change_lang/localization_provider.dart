import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.dark;
  String currentLanguage = 'ar';

  bool get isDarkTheme => currentTheme == ThemeMode.dark;

  void changeTheme(ThemeMode theme) {
    if (currentTheme == theme) return;
    currentTheme = theme;
    notifyListeners();
  }

  void changeLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }
}
