import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';

final class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.label,
    required this.controller,
    this.validator,
    super.key,
  });
  final String label;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allXS,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
