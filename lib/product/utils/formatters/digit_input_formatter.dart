import 'package:flutter/services.dart';

final class DigitInputFormatter extends TextInputFormatter {
  static final RegExp regex = RegExp(r'^\d+([.,]?\d*)?$');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (regex.hasMatch(newValue.text)) return newValue;
    return oldValue;
  }
}
