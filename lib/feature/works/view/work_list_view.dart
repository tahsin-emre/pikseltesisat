import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/works/mixin/work_list_mixin.dart';
import 'package:pikseltesisat/feature/works/widget/work_tile.dart';

final class WorkListView extends StatefulWidget {
  const WorkListView({super.key});

  @override
  State<WorkListView> createState() => _WorkListViewState();
}

class _WorkListViewState extends State<WorkListView> with WorkListMixin {
  @override
  Widget build(BuildContext context) {
    return FirestoreListView(
      query: workQuery,
      itemBuilder: (_, e) => WorkTile(e.data()),
    );
  }
}
