import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/sub_features/ui_kit/custom_text_field.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/work/work_comment.dart';
import 'package:pikseltesisat/product/utils/constants/app_radius.dart';
import 'package:pikseltesisat/product/utils/validators/form_validators.dart';

final class WorkLogAlert extends StatefulWidget {
  const WorkLogAlert({super.key});
  @override
  State<WorkLogAlert> createState() => _WorkLogAlertState();
}

class _WorkLogAlertState extends State<WorkLogAlert> {
  final _workLogController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.allM,
      ),
      title: Center(child: Text(LocaleKeys.work_addLog.tr())),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            label: LocaleKeys.base_description.tr(),
            controller: _workLogController,
            validator: FormValidators.required,
            multiLine: true,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(LocaleKeys.base_cancel.tr()),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, workComment),
          child: Text(LocaleKeys.base_save.tr()),
        ),
      ],
    );
  }

  WorkComment get workComment {
    return WorkComment(
      comment: _workLogController.text,
      createdAt: DateTime.now(),
      personalName: '',
    );
  }
}
