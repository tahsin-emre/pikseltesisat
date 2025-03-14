import 'package:easy_localization/easy_localization.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/utils/formatters/digit_input_formatter.dart';

final class FormValidators {
  const FormValidators._();

  static String? required<T>(T? value) {
    if (value == null) return LocaleKeys.validators_required.tr();
    if (value is String && value.isEmpty) {
      return LocaleKeys.validators_required.tr();
    }
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

  static String? doubleNumeric(String? value) {
    if (value == null) return LocaleKeys.validators_required.tr();
    if (value.isEmpty) return LocaleKeys.validators_required.tr();
    final exp = DigitInputFormatter.regex;
    if (!exp.hasMatch(value)) return LocaleKeys.validators_doubleNumeric.tr();
    return null;
  }
}
