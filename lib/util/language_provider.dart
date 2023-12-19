import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {

  Locale _appLocale = const Locale('km');

  Locale get appLocal => _appLocale;

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('lang') == null) {
      _appLocale = const Locale('en');
      return _appLocale;
    }
    _appLocale = Locale(prefs.getString("lang") ?? "en");
    return _appLocale;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == const Locale("en")) {
      _appLocale = const Locale("en");
      await prefs.setString('lang', 'en');
      await prefs.setString('countryCode', 'US');
    } else {
      _appLocale = const Locale("km");
      await prefs.setString('lang', 'km');
      await prefs.setString('countryCode', 'KH');
    }
    notifyListeners();
  }
}