import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';

final class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.label,
    required this.controller,
    super.key,
  });
  final String label;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allXS,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
