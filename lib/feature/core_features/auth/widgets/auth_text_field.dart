import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';

final class AuthTextField extends StatelessWidget {
  const AuthTextField({
    required this.label,
    required this.icon,
    required this.controller,
    required this.isPassword,
    this.validator,
    super.key,
  });

  final String label;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPaddings.allS,
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon.toIcon,
        ),
      ),
    );
  }
}
