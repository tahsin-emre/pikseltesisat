import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/personals/mixin/personal_detail_mixin.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/title_text.dart';
import 'package:pikseltesisat/feature/works/widget/work_tile.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/personal/personal.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';
import 'package:pikseltesisat/product/utils/extensions/app_sizes_ext.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class PersonalDetailView extends StatefulWidget {
  const PersonalDetailView({required this.personal, super.key});
  final Personal personal;
  @override
  State<PersonalDetailView> createState() => _PersonalDetailViewState();
}

class _PersonalDetailViewState extends State<PersonalDetailView>
    with PersonalDetailMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allS,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(LocaleKeys.personal_personalDetail.tr()),
          Text(personal.name ?? ''),
          const Divider(),
          TitleText(LocaleKeys.work_workList.tr()),
          AppSizes.s.toHeight,
          FirestoreListView<Work>(
            shrinkWrap: true,
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
