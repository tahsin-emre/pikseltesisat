import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';

final class DashboardCard extends StatelessWidget {
  const DashboardCard({
    required this.label,
    required this.onTap,
    super.key,
  });
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPaddings.allM,
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 8,
          child: Container(
            padding: AppPaddings.allM,
            child: Row(
              children: [
                Expanded(child: Text(label)),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
