import 'package:flutter/material.dart';

class BaseAppBar extends AppBar {
  BaseAppBar({
    required String title,
    super.leading,
    super.actions,
    super.key,
  }) : super(
          forceMaterialTransparency: false,
          excludeHeaderSemantics: false,
          title: Text(title),
          notificationPredicate: (notification) => false,
        );
}
