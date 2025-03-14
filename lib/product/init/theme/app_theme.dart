import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/utils/constants/app_radius.dart';

final class AppTheme {
  AppTheme._();
  static final colorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);
  static ThemeData get light => ThemeData.light().copyWith(
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.onSecondary,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.onSecondary,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: const TextStyle(color: Colors.black),
        ),
        cardTheme: const CardThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.allS,
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.allS,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: AppRadius.allS),
          ),
        ),
      );
}
