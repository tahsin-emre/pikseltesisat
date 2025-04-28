import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final class LocalizationManager {
  const LocalizationManager._();

  static EasyLocalization app(Widget app) {
    return EasyLocalization(
      path: path,
      supportedLocales: supportedLocales,
      useOnlyLangCode: isOnlyLangCode,
      fallbackLocale: fallbackLocale,
      startLocale: fallbackLocale,
      child: app,
    );
  }

  static const path = 'assets/localization';
  static const fallbackLocale = Locale('en');
  static const supportedLocales = [Locale('tr'), Locale('en')];
  static const isOnlyLangCode = true;
}
