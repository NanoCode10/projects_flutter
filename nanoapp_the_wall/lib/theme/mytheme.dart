import 'package:flutter/material.dart';
import 'package:nanoapp_the_wall/theme/dark_theme.dart';
import 'package:nanoapp_the_wall/theme/light_theme.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData = darkTheme;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
