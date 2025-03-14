import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';

enum ServiceType {
  @JsonValue(0)
  none(LocaleKeys.base_error, Colors.grey),
  @JsonValue(1)
  service(LocaleKeys.serviceType_service, Colors.teal),
  @JsonValue(2)
  rework(LocaleKeys.serviceType_rework, Colors.brown),
  @JsonValue(3)
  extra(LocaleKeys.serviceType_extra, Colors.orange),
  @JsonValue(4)
  other(LocaleKeys.base_otherValue, Colors.black),
  ;

  const ServiceType(this.localeKey, this.color);
  final String localeKey;
  final Color color;
}
