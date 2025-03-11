import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:pikseltesisat/product/utils/formatters/digit_input_formatter.dart';

final class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.label,
    required this.controller,
    this.validator,
    this.onFieldSubmitted,
    this.suffix,
    this.isNumeric = false,
    this.multiLine = false,
    super.key,
  });
  final String label;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final bool isNumeric;
  final String? suffix;
  final bool multiLine;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allXS,
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        validator: validator,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        minLines: multiLine ? 3 : 1,
        maxLines: multiLine ? 5 : 1,
        inputFormatters: [if (isNumeric) DigitInputFormatter()],
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixText: suffix,
        ),
      ),
    );
  }
}
