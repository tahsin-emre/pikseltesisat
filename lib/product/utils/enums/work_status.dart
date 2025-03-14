import 'package:json_annotation/json_annotation.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';

enum WorkStatus {
  @JsonValue(0)
  none(LocaleKeys.base_error),
  @JsonValue(1)
  pending(LocaleKeys.workStatus_pending),
  @JsonValue(2)
  completed(LocaleKeys.workStatus_completed),
  @JsonValue(3)
  cancelled(LocaleKeys.workStatus_cancelled),
  @JsonValue(4)
  other(LocaleKeys.base_otherValue),
  ;

  const WorkStatus(this.localeKey);
  final String localeKey;
}
