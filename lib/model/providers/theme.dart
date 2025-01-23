import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeMode _themeData;
  ThemeChanger(this._themeData);
  getTheme() => _themeData;
  setTheme(ThemeMode theme) {
    _themeData = theme;
    notifyListeners();
  }

  String _svgTheme = 'assets/icons/night-mode.svg';
  String _textTheme = 'Dark Mode';

  String get svgTheme => _svgTheme;

  set svgTheme(String value) {
    _svgTheme = value;
    notifyListeners();
  }

  String get textTheme => _textTheme;

  set textTheme(String value) {
    _textTheme = value;
    notifyListeners();
  }

  bool _isDark = false;

  bool get isDark => _isDark;

  set isDark(bool value) {
    _isDark = value;
    notifyListeners();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black54,
    colorScheme: const ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
  );
}
