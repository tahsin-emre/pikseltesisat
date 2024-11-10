import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/base_app_bar.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';

final class PlumberDetailView extends StatefulWidget {
  const PlumberDetailView({required this.plumber, super.key});
  final Plumber plumber;
  @override
  State<PlumberDetailView> createState() => _PlumberDetailViewState();
}

class _PlumberDetailViewState extends State<PlumberDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: ''),
      body: Center(
        child: Text(
          widget.plumber.toMap().toString().replaceAll(',', '\n'),
        ),
      ),
    );
  }
}
