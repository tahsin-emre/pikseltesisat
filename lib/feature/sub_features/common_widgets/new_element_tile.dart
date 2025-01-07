import 'package:flutter/material.dart';

class NewElementTile extends StatelessWidget {
  const NewElementTile({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });
  final Icon icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: icon,
        title: Text(title),
      ),
    );
  }
}
