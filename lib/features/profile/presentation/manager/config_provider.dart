import 'package:flutter/material.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  bool get isDarkThme => currentTheme == ThemeMode.dark;

  void updateAppTheme(ThemeMode theme) {
    currentTheme = theme;
    notifyListeners();
  }
}
