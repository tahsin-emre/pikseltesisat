import 'package:flutter/material.dart';

class BaseAppBar extends AppBar {
  BaseAppBar({
    required String title,
    super.leading,
    super.actions,
    super.key,
  }) : super(
          forceMaterialTransparency: false,
          title: Text(title),
        );
}
