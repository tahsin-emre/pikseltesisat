import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/plumbers/mixin/plumber_detail_mixin.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/title_text.dart';
import 'package:pikseltesisat/feature/works/widget/work_tile.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class PlumberDetailView extends StatefulWidget {
  const PlumberDetailView({required this.plumber, super.key});
  final Plumber plumber;
  @override
  State<PlumberDetailView> createState() => _PlumberDetailViewState();
}

class _PlumberDetailViewState extends State<PlumberDetailView>
    with PlumberDetailMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allS,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(LocaleKeys.plumber_plumberDetail.tr()),
          Text(plumber.name ?? ''),
          const Divider(),
          TitleText(LocaleKeys.work_workList.tr()),
          const SizedBox(height: AppSizes.s),
          FirestoreListView<Work>(
            query: query,
            emptyBuilder: (context) => const Text('Henüz İş Yok'),
            errorBuilder: (context, error, stackTrace) =>
                SelectableText('Hata Oluştu $error'),
            itemBuilder: (_, e) => WorkTile(e.data()),
          ).expanded,
        ],
      ),
    );
  }
}
