import 'package:collection/collection.dart';
import 'package:pikseltesisat/product/init/data/data_province_district.dart';
import 'package:pikseltesisat/product/models/customer/district.dart';
import 'package:pikseltesisat/product/utils/enums/work_kind.dart';

extension IntExt on int {
  District? get toDisctrict {
    return DataProvinceDistrict.districts.firstWhereOrNull((e) => e.id == this);
  }

  WorkKind? get toWorkKind {
    return WorkKind.values.firstWhereOrNull((e) => e.index == this);
  }
}
