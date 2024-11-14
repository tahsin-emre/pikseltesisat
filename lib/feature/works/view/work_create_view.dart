import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/base_app_bar.dart';
import 'package:pikseltesisat/product/models/work/work.dart';

class WorkCreateView extends StatefulWidget {
  const WorkCreateView({this.work, super.key});
  final Work? work;
  @override
  State<WorkCreateView> createState() => _WorkCreateViewState();
}

class _WorkCreateViewState extends State<WorkCreateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: ''),
    );
  }
}
