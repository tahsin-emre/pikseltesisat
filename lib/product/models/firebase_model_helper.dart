import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:pikseltesisat/product/init/data/data_province_district.dart';
import 'package:pikseltesisat/product/models/customer/district.dart';
import 'package:pikseltesisat/product/models/customer/province.dart';

final class FirebaseModelHelper {
  const FirebaseModelHelper._();

  /// It will convert to datetime from timestamp
  static DateTime? timestampToDateTime(Timestamp? timestamp) =>
      timestamp?.toDate();

  static Timestamp? dateTimeToTimestamp(DateTime? dateTime) =>
      dateTime != null ? Timestamp.fromDate(dateTime) : null;

  static District? districtFromInt(int? id) =>
      DataProvinceDistrict.districts.firstWhereOrNull((e) => e.id == id);

  static int? districtToInt(District? district) => district?.id;

  static Province? provinceFromInt(int? id) =>
      DataProvinceDistrict.provinces.firstWhereOrNull((e) => e.id == id);

  static int? provinceToInt(Province? province) => province?.id;
}
