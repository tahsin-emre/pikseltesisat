import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/search/view/search_list_view.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/services/base_service.dart';
import 'package:pikseltesisat/product/services/customer_service.dart';
import 'package:pikseltesisat/product/utils/extensions/string_ext.dart';

mixin SearchListMixin on State<SearchListView> {
  final searchController = TextEditingController();
  final _customerService = locator<CustomerService>();

  Query<Customer>? query;

  Future<void> onSearch() async {
    final searchValue = searchController.text;
    if (searchValue.isEmpty || searchValue.length < 3) {
      query = null;
      return;
    }
    query = _customerService.customerCollection.where(
      FirestoreFields.searchIndex.name,
      arrayContainsAny: searchValue.generateSearchIndex,
    );
    setState(() {});
  }

  void onSubmit(String value) {
    searchController.text = value;
    onSearch();
  }
}
