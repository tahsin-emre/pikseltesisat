import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/utils/enums/user_type.dart';

extension MyUserExt on MyUser {
  bool get isAdmin => userType == UserType.admin;
  bool get isPersonal => userType == UserType.personal;
  bool get isWaiting => userType == UserType.waiting;
}
