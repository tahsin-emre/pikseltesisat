import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';

enum UserType {
  @JsonValue(0)
  none,
  @JsonValue(1)
  admin,
  @JsonValue(2)
  personal,
  @JsonValue(3)
  waiting,
  ;

  String get title {
    return switch (this) {
      none => LocaleKeys.userType_none.tr(),
      admin => LocaleKeys.userType_admin.tr(),
      personal => LocaleKeys.userType_personal.tr(),
      waiting => LocaleKeys.userType_waiting.tr(),
    };
  }
}
