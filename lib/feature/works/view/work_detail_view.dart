import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/title_text.dart';
import 'package:pikseltesisat/feature/works/mixin/work_detail_mixin.dart';
import 'package:pikseltesisat/feature/works/widget/work_tile.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/work/work.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:skeletonizer/skeletonizer.dart';

part '../widget/work_detail_widgets.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(LocaleKeys.work_workDetail.tr()),
                _Address(addressNotifier),
                const Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}
