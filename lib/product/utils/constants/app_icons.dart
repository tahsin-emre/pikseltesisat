import 'package:flutter/material.dart';

final class AppIcons {
  const AppIcons._();
  static const home = Icons.home_rounded;
  static const settings = Icons.settings_rounded;
  static const info = Icons.info_rounded;
  static const logout = Icons.power_settings_new_rounded;
  static const language = Icons.language_rounded;
  static const customers = Icons.people_alt_rounded;
  static const plumbers = Icons.plumbing_rounded;
}

extension AppIconsExtension on IconData {
  Icon get toIcon => Icon(this);

  Icon toCustomIcon({double? size, Color? color}) {
    return Icon(this, size: size, color: color);
  }
}
