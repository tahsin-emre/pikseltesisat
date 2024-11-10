import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/plumbers/mixin/plumber_list_mixin.dart';

final class PlumberListView extends StatefulWidget {
  const PlumberListView({super.key});

  @override
  State<PlumberListView> createState() => _PlumberListViewState();
}

class _PlumberListViewState extends State<PlumberListView>
    with PlumberListMixin {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.amberAccent);
  }
}
