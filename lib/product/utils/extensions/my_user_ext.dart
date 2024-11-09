import 'package:pikseltesisat/product/models/my_user/my_user.dart';
import 'package:pikseltesisat/product/models/my_user/user_type.dart';

extension MyUserExt on MyUser {
  bool get isAdmin => userType == UserType.admin;
  bool get isPlumber => userType == UserType.plumber;
}
