import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/works/view/work_list_view.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/services/work_service.dart';

mixin WorkListMixin on State<WorkListView> {
  final _workService = WorkService();
  Query<Work> get workQuery => _workService.workCollection;
}
