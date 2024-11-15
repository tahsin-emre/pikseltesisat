import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';

class CustomerDetailFab extends StatelessWidget {
  const CustomerDetailFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: AppIcons.moreHoriz.toIcon,
    );
  }
}
