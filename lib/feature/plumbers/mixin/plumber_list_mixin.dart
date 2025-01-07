import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/plumbers/view/plumber_list_view.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';
import 'package:pikseltesisat/product/services/plumber_service.dart';

mixin PlumberListMixin on State<PlumberListView> {
  final _plumberService = PlumberService();

  Query<Plumber> get plumberQuery => _plumberService.plumberCollection;
}
