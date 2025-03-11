import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/customers/widget/customer_tile.dart';
import 'package:pikseltesisat/feature/search/mixin/search_list_mixin.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/custom_text_field.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class SearchListView extends StatefulWidget {
  const SearchListView({super.key});

  @override
  State<SearchListView> createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> with SearchListMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomTextField(
              label: LocaleKeys.base_search.tr(),
              controller: searchController,
              onFieldSubmitted: onSubmit,
            ).expanded,
            IconButton(onPressed: onSearch, icon: AppIcons.search.toIcon),
          ],
        ),
        if (query != null)
          FirestoreListView<Customer>(
            query: query!,
            emptyBuilder: (context) =>
                const Text('Herhangi bir sonuç bulunamadı.'),
            errorBuilder: (context, error, stackTrace) =>
                SelectableText('Hata Oluştu $error'),
            itemBuilder: (_, e) => CustomerTile(customer: e.data()),
          ).expanded,
      ],
    );
  }
}
