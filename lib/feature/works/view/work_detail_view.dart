import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/customers/widget/customer_detail_card.dart';
import 'package:pikseltesisat/feature/works/mixin/work_detail_mixin.dart';
import 'package:pikseltesisat/feature/works/widget/work_tile.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/models/personal/personal.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';
import 'package:skeletonizer/skeletonizer.dart';

part '../widget/work_detail_widgets/work_detail_customer_card.dart';
part '../widget/work_detail_widgets/work_detail_personal_card.dart';
part '../widget/work_detail_widgets/work_detail_old_works.dart';
part '../widget/work_detail_widgets/work_detail_comments.dart';

class WorkDetailView extends StatefulWidget {
  const WorkDetailView({required this.work, super.key});
  final Work work;
  @override
  State<WorkDetailView> createState() => _WorkDetailViewState();
}

class _WorkDetailViewState extends State<WorkDetailView> with WorkDetailMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loadingNotifier,
      builder: (_, isLoading, __) {
        return Padding(
          padding: AppPaddings.allM,
          child: Skeletonizer(
            enabled: isLoading,
            child: CustomScrollView(
              slivers: [
                _CustomerCard(customerNotifier).toSliver,
                _PersonalCard(personalNotifier).toSliver,
                const Divider().toSliver,
                const _WorkDetailComments().toSliver,
                const Divider().toSliver,
                if (oldWorksQuery != null)
                  _WorkDetailOldWorks(work, oldWorksQuery!).toSliver,
              ],
            ),
          ),
        );
      },
    );
  }
}
