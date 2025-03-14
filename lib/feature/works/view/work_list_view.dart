import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/works/mixin/work_list_mixin.dart';
import 'package:pikseltesisat/feature/works/widget/work_list_time_selector.dart';
import 'package:pikseltesisat/feature/works/widget/work_tile.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class WorkListView extends StatefulWidget {
  const WorkListView({super.key});

  @override
  State<WorkListView> createState() => _WorkListViewState();
}

class _WorkListViewState extends State<WorkListView> with WorkListMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dateNotifier,
      builder: (_, date, __) {
        return Column(
          children: [
            WorkListTimeSelector(
              onDateChange: changeDate,
              focusedDate: date ?? DateTime.now(),
            ),
            // NewElementTile(
            //   icon: AppIcons.add.toIcon,
            //   title: LocaleKeys.work_newWork.tr(),
            //   onTap: () => const WorkCreateRoute().push<void>(context),
            // ),
            if (workQuery != null)
              FirestoreListView(
                shrinkWrap: true,
                query: workQuery!,
                itemBuilder: (_, e) => WorkTile(e.data()),
              ).expanded,
          ],
        );
      },
    );
  }
}
