import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';

enum WorkType {
  @JsonValue(0)
  none(LocaleKeys.base_error, Colors.grey),
  @JsonValue(1)
  waterLeakage(LocaleKeys.workType_waterLeakage, Colors.blue),
  @JsonValue(2)
  unclogging(LocaleKeys.workType_unclogging, Colors.purple),
  @JsonValue(3)
  repair(LocaleKeys.workType_repair, Colors.lightGreen),
  @JsonValue(4)
  washing(LocaleKeys.workType_washing, Colors.amber),
  @JsonValue(5)
  other(LocaleKeys.base_otherValue, Colors.black),
  ;

  const WorkType(this.localeKey, this.color);
  final String localeKey;
  final Color color;
}
