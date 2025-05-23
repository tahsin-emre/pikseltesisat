import 'package:collection/collection.dart';
import 'package:pikseltesisat/product/init/data/data_province_district.dart';
import 'package:pikseltesisat/product/models/customer/district.dart';
import 'package:pikseltesisat/product/utils/enums/user_type.dart';

extension IntExt on int {
  UserType? get toUserType {
    return UserType.values.firstWhereOrNull((e) => e.index == this);
  }

  District? get toDisctrict {
    return DataProvinceDistrict.districts.firstWhereOrNull((e) => e.id == this);
  }
}
