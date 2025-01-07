import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';

enum WorkKind {
  none(LocaleKeys.base_error, Colors.grey),
  service(LocaleKeys.work_service, Colors.teal),
  waterLeakage(LocaleKeys.work_waterLeakage, Colors.blue),
  unclogging(LocaleKeys.work_unclogging, Colors.purple),
  repair(LocaleKeys.work_repair, Colors.lightGreen),
  washing(LocaleKeys.work_washing, Colors.amber),
  additional(LocaleKeys.work_additional, Colors.brown),
  backWork(LocaleKeys.work_backWork, Colors.orange),
  ;

  const WorkKind(this.localeKey, this.color);
  final String localeKey;
  final Color color;
}
