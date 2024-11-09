import 'package:easy_localization/easy_localization.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';

final class FormValidators {
  const FormValidators._();

  static String? required(String? value) {
    if (value == null) return LocaleKeys.validators_required.tr();
    if (value.isEmpty) return LocaleKeys.validators_required.tr();
    return null;
  }

  static String? email(String? value) {
    if (value == null) return LocaleKeys.validators_required.tr();
    if (value.isEmpty) return LocaleKeys.validators_required.tr();
    final exp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);
    if (!exp) return LocaleKeys.validators_email.tr();
    return null;
  }

  static String? password(String? value) {
    if (value == null) return LocaleKeys.validators_required.tr();
    if (value.isEmpty) return LocaleKeys.validators_required.tr();
    if (value.length < 6) return LocaleKeys.validators_password.tr();
    return null;
  }
}
