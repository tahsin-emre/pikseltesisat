import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';

final class DrawerTile extends StatelessWidget {
  const DrawerTile({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      style: ListTileStyle.drawer,
      title: Text(title),
      leading: icon.toIcon,
      onTap: onTap,
    );
  }
}
