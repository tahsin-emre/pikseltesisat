import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/router/app_routes.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';

final class PlumberTile extends StatelessWidget {
  const PlumberTile({required this.plumber, super.key});
  final Plumber plumber;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => PlumberDetailRoute(plumber).go(context),
      title: Text(plumber.name ?? ''),
      subtitle: Text(plumber.id),
      trailing: AppIcons.forward.toIcon,
    );
  }
}
