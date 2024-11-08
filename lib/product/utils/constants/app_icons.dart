import 'package:flutter/material.dart';

final class AppIcons {
  const AppIcons._();
  static const IconData home = Icons.home;
}

extension AppIconsExtension on IconData {
  Icon get toIcon => Icon(this);

  Icon toCustomIcon({double? size, Color? color}) {
    return Icon(this, size: size, color: color);
  }
}
