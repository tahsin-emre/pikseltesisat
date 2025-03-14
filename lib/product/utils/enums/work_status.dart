import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';

enum WorkStatus {
  none(LocaleKeys.base_error),
  pending(LocaleKeys.workStatus_pending),
  completed(LocaleKeys.workStatus_completed),
  cancelled(LocaleKeys.workStatus_cancelled),
  other(LocaleKeys.base_otherValue),
  ;

  const WorkStatus(this.localeKey);
  final String localeKey;
}
