import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';

final class AppRadius {
  const AppRadius._();

  /// Value: 0.0
  static const BorderRadius zero = BorderRadius.zero;

  /// Value: 4.0
  static const BorderRadius allXXS =
      BorderRadius.all(Radius.circular(AppSizes.xxs));

  /// Value: 8.0
  static const BorderRadius allXS =
      BorderRadius.all(Radius.circular(AppSizes.xs));

  /// Value: 12.0
  static const BorderRadius allS =
      BorderRadius.all(Radius.circular(AppSizes.s));

  /// Value: 16.0
  static const BorderRadius allM =
      BorderRadius.all(Radius.circular(AppSizes.m));

  /// Value: 20.0
  static const BorderRadius allL =
      BorderRadius.all(Radius.circular(AppSizes.l));

  /// Value: 24.0
  static const BorderRadius allXL =
      BorderRadius.all(Radius.circular(AppSizes.xl));

  /// Value: 28.0
  static const BorderRadius allXXL =
      BorderRadius.all(Radius.circular(AppSizes.xxl));
}
