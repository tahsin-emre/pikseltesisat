import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';

final class CustomerDetailFab extends StatelessWidget {
  const CustomerDetailFab({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularMenu(
      alignment: Alignment.bottomRight,
      items: [
        _FabItem(
          icon: AppIcons.edit,
          badgeLabel: 'Edit',
          onTap: () {},
        ),
        _FabItem(
          icon: AppIcons.call,
          badgeLabel: 'Call',
          onTap: () {},
        ),
      ],
    );
  }
}

class _FabItem extends CircularMenuItem {
  _FabItem({
    required super.onTap,
    required super.icon,
    required super.badgeLabel,
  }) : super();
}
