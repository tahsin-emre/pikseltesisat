import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';

enum WorkType {
  none(LocaleKeys.base_error, Colors.grey),
  waterLeakage(LocaleKeys.workType_waterLeakage, Colors.blue),
  unclogging(LocaleKeys.workType_unclogging, Colors.purple),
  repair(LocaleKeys.workType_repair, Colors.lightGreen),
  washing(LocaleKeys.workType_washing, Colors.amber),
  other(LocaleKeys.base_otherValue, Colors.black),
  ;

  const WorkType(this.localeKey, this.color);
  final String localeKey;
  final Color color;
}
