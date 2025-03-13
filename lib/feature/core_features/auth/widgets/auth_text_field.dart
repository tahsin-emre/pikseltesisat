import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';

final class AuthTextField extends StatefulWidget {
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
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPaddings.allS,
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.isPassword && !_isPasswordVisible,
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: widget.icon.toIcon,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: _isPasswordVisible
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                )
              : null,
        ),
      ),
    );
  }
}
