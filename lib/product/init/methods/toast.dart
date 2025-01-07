import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void toast(String text) {
  toastification.show(
    title: Text(text),
    style: ToastificationStyle.minimal,
    alignment: Alignment.topRight,
    type: ToastificationType.info,
    showIcon: false,
    autoCloseDuration: const Duration(seconds: 3),
  );
}
