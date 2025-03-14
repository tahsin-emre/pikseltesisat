import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/models/personal/personal.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';

final class PersonalTile extends StatelessWidget {
  const PersonalTile({required this.personal, super.key});
  final Personal personal;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => PersonalDetailRoute(personal).push<void>(context),
      title: Text(personal.name ?? ''),
      subtitle: Text(personal.id),
      trailing: AppIcons.forward.toIcon,
    );
  }
}
