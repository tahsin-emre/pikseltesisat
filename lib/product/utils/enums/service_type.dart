import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';

enum ServiceType {
  none(LocaleKeys.base_error, Colors.grey),
  service(LocaleKeys.serviceType_service, Colors.teal),
  rework(LocaleKeys.serviceType_rework, Colors.brown),
  extra(LocaleKeys.serviceType_extra, Colors.orange),
  ;

  const ServiceType(this.localeKey, this.color);
  final String localeKey;
  final Color color;
}
