import 'package:covid19_tracker/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  int? _appThemeCode;
  SharedPreferences? _prefs;
  ThemeData? _appThemeData;
  ThemeData? get appThemeData => _appThemeData;
  int? get appThemeCode => _appThemeCode;
  SharedPreferences? get appPrefs => _prefs;
  initAppTheme() async {
    _prefs = await SharedPreferences.getInstance();
    _appThemeCode = _prefs!.containsKey('appThemeCode')
        ? _prefs!.getInt('appThemeCode')
        : (isDarkMode() ? 1 : 0);
    _prefs!.setInt('appThemeCode', _appThemeCode!);
    setAppTheme(_appThemeCode!);
  }

  bool isDarkMode() {
    final darkMode =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    if (darkMode == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }

  setAppTheme(int themeCode) {
    switch (themeCode) {
      case 0:
        _appThemeData = lightTheme;
        break;
      case 1:
        _appThemeData = darkTheme;
        break;
      default:
        _appThemeData = darkTheme;
    }
    _appThemeCode = themeCode;
    _prefs!.setInt('appThemeCode', _appThemeCode!);
    notifyListeners();
  }
}
