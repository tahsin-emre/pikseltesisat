import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  void notify(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: Durations.extralong4 * 2,
        content: Text(message),
      ),
    );
  }
}
