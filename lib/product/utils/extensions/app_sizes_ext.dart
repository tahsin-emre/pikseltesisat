import 'package:flutter/material.dart';

/// Extension to convert AppSizes values to SizedBox widgets
extension AppSizesExt on double {
  /// Returns a SizedBox with this value as height
  /// Example: AppSizes.maxiM.toHeight() -> SizedBox(height: 100.0)
  SizedBox get toHeight => SizedBox(height: this);

  /// Returns a SizedBox with this value as width
  /// Example: AppSizes.maxiM.toWidth() -> SizedBox(width: 100.0)
  SizedBox get toWidth => SizedBox(width: this);

  /// Returns a SizedBox with this value as both width and height
  /// Example: AppSizes.maxiM.toSize() -> SizedBox(width: 100.0, height: 100.0)
  SizedBox get toSize => SizedBox(width: this, height: this);
}
