import 'package:flutter/material.dart';

final class BaseAppBar extends AppBar {
  BaseAppBar({
    required String title,
    super.actions,
    super.key,
  }) : super(
          forceMaterialTransparency: false,
          title: Text(title),
        );
}
