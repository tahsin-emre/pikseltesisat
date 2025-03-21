import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/utils/enums/user_type.dart';

extension MyUserExt on MyUser? {
  bool get isAdmin => this?.userType == UserType.admin;
  bool get isPersonal => this?.userType == UserType.personal;
  bool get isWaiting => this?.userType == UserType.waiting;
}
