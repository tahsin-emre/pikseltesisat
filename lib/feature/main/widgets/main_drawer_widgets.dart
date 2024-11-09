part of '../view/main_drawer.dart';

final class _DrawerTile extends StatelessWidget {
  const _DrawerTile({
    required this.title,
    required this.icon,
    required this.onTap,
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
