import 'package:flutter/material.dart';

final class AppIcons {
  const AppIcons._();
  static const home = Icons.home_rounded;
  static const menu = Icons.menu_rounded;
  static const settings = Icons.settings_rounded;
  static const info = Icons.info_rounded;
  static const logout = Icons.power_settings_new_rounded;
  static const language = Icons.language_rounded;
  static const customers = Icons.people_alt_rounded;
  static const personals = Icons.plumbing_rounded;
  static const prices = Icons.attach_money_rounded;
  static const email = Icons.email_rounded;
  static const password = Icons.lock_rounded;
  static const phone = Icons.phone_rounded;
  static const address = Icons.location_on_rounded;
  static const search = Icons.search_rounded;
  static const add = Icons.add_rounded;
  static const edit = Icons.edit_rounded;
  static const delete = Icons.delete_rounded;
  static const save = Icons.save_rounded;
  static const cancel = Icons.cancel_rounded;
  static const close = Icons.close_rounded;
  static const back = Icons.arrow_back_rounded;
  static const forward = Icons.arrow_forward_rounded;
  static const up = Icons.arrow_upward_rounded;
  static const down = Icons.arrow_downward_rounded;
  static const addPerson = Icons.person_add_rounded;
  static const person = Icons.person_rounded;
  static const report = Icons.file_open_rounded;
  static const works = Icons.work_history_rounded;
  static const moreVert = Icons.more_vert_rounded;
  static const moreHoriz = Icons.more_horiz_rounded;
  static const call = Icons.call_rounded;
  static const location = Icons.location_on_rounded;
  static const calendar = Icons.calendar_month;
  static const done = Icons.done_rounded;
  static const priceOffer = Icons.price_check_rounded;
  static const comment = Icons.comment_rounded;
  static const numbers = Icons.numbers_rounded;
}

extension AppIconsExtension on IconData {
  Icon get toIcon => Icon(this);

  Icon toCustomIcon({double? size, Color? color}) {
    return Icon(this, size: size, color: color);
  }
}
