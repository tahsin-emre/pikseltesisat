import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:pikseltesisat/feature/personals/view/personal_create_view.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/methods/toast.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/services/personal_service.dart';

mixin PersonalCreateMixin on State<PersonalCreateView> {
  final personalService = locator<PersonalService>();

  Future<void> confirmPersonal(MyUser user) async {
    final result = await personalService.confirmPersonal(user);
    if (result != null) {
      toast(result);
      return;
    }
    toast(LocaleKeys.personal_personalAdded.tr());
  }
}
