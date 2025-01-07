import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:pikseltesisat/feature/plumbers/view/plumber_create_view.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/init/methods/toast.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/services/plumber_service.dart';

mixin PlumberCreateMixin on State<PlumberCreateView> {
  final plumberService = PlumberService();

  Future<void> confirmPlumber(MyUser user) async {
    final result = await plumberService.confirmPlumber(user);
    if (result != null) {
      toast(result);
      return;
    }
    toast(LocaleKeys.plumber_plumberAdded.tr());
  }
}
