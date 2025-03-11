import 'package:flutter/services.dart';

final class DigitInputFormatter extends TextInputFormatter {
  final RegExp _regex = RegExp(r'^\d+([.,]?\d*)?$');
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (_regex.hasMatch(newValue.text)) return newValue;
    return oldValue;
  }
}
