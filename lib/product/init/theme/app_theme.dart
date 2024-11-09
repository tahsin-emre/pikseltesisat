import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/utils/constants/app_radius.dart';

final class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData.light().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: AppRadius.allS),
          ),
        ),
      );

  static ThemeData get dark => ThemeData.dark().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: AppRadius.allS),
          ),
        ),
      );
}
