import 'package:flutter/material.dart';

class LanguageManager extends ChangeNotifier {
  Locale _currentLocale = const Locale('tr', 'TR');

  Locale get currentLocale => _currentLocale;

  void changeLanguage(Locale newLocale) {
    if (_currentLocale != newLocale) {
      _currentLocale = newLocale;
      notifyListeners();
    }
  }
}
