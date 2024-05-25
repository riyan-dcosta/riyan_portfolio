import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  late ThemeMode _systemTheme;

  ThemeChanger(this._systemTheme);

  get getCurrentTheme => _systemTheme;

  switchTheme() {
    if (_systemTheme == ThemeMode.dark) {
      _systemTheme = ThemeMode.light;
    } else {
      _systemTheme = ThemeMode.dark;
    }

    notifyListeners();
  }
}
