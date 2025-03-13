import 'package:flutter/material.dart';

final class TitleText extends Text {
  const TitleText(super.data, {super.key})
      : super(
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        );
}
