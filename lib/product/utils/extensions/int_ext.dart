import 'package:collection/collection.dart';
import 'package:pikseltesisat/product/init/data/data_province_district.dart';
import 'package:pikseltesisat/product/models/customer/district.dart';
import 'package:pikseltesisat/product/utils/enums/service_type.dart';
import 'package:pikseltesisat/product/utils/enums/user_type.dart';
import 'package:pikseltesisat/product/utils/enums/work_type.dart';

extension IntExt on int {
  UserType? get toUserType {
    return UserType.values.firstWhereOrNull((e) => e.index == this);
  }

  District? get toDisctrict {
    return DataProvinceDistrict.districts.firstWhereOrNull((e) => e.id == this);
  }

  WorkType? get toWorkType {
    return WorkType.values.firstWhereOrNull((e) => e.index == this);
  }

  ServiceType? get toServiceType {
    return ServiceType.values.firstWhereOrNull((e) => e.index == this);
  }
}
