import 'package:flutter/material.dart';

final class AppIcons {
  const AppIcons._();
  static const IconData home = Icons.home_rounded;
  static const IconData menu = Icons.menu_rounded;
  static const IconData settings = Icons.settings_rounded;
  static const IconData info = Icons.info_rounded;
  static const IconData logout = Icons.power_settings_new_rounded;
  static const IconData language = Icons.language_rounded;
  static const IconData customers = Icons.people_alt_rounded;
  static const IconData personals = Icons.plumbing_rounded;
  static const IconData prices = Icons.attach_money_rounded;
  static const IconData email = Icons.email_rounded;
  static const IconData password = Icons.lock_rounded;
  static const IconData phone = Icons.phone_rounded;
  static const IconData address = Icons.location_on_rounded;
  static const IconData search = Icons.search_rounded;
  static const IconData add = Icons.add_rounded;
  static const IconData edit = Icons.edit_rounded;
  static const IconData delete = Icons.delete_rounded;
  static const IconData save = Icons.save_rounded;
  static const IconData cancel = Icons.cancel_rounded;
  static const IconData close = Icons.close_rounded;
  static const IconData back = Icons.arrow_back_rounded;
  static const IconData forward = Icons.arrow_forward_rounded;
  static const IconData up = Icons.arrow_upward_rounded;
  static const IconData down = Icons.arrow_downward_rounded;
  static const IconData addPerson = Icons.person_add_rounded;
  static const IconData person = Icons.person_rounded;
  static const IconData report = Icons.file_open_rounded;
  static const IconData works = Icons.work_history_rounded;
  static const IconData moreVert = Icons.more_vert_rounded;
  static const IconData moreHoriz = Icons.more_horiz_rounded;
  static const IconData call = Icons.call_rounded;
  static const IconData location = Icons.location_on_rounded;
  static const IconData calendar = Icons.calendar_month;
  static const IconData done = Icons.done_rounded;
  static const IconData priceOffer = Icons.price_check_rounded;
  static const IconData comment = Icons.comment_rounded;
  static const IconData numbers = Icons.numbers_rounded;
}

extension AppIconsExtension on IconData {
  Icon get toIcon => Icon(this);

  Icon toCustomIcon({double? size, Color? color}) {
    return Icon(this, size: size, color: color);
  }
}
