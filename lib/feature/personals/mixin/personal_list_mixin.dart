import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/personals/view/personal_list_view.dart';
import 'package:pikseltesisat/product/models/personal/personal.dart';
import 'package:pikseltesisat/product/services/personal_service.dart';

mixin PersonalListMixin on State<PersonalListView> {
  final _personalService = PersonalService();

  Query<Personal> get personalQuery => _personalService.personalCollection;
}
