import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:pikseltesisat/product/models/customer/district.dart';
import 'package:pikseltesisat/product/utils/extensions/int_ext.dart';

final class Customer extends Equatable {
  const Customer({
    this.id = '',
    this.name,
    this.phone,
    this.address,
    this.province,
    this.district,
    this.searchIndex,
  });

  factory Customer.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final map = snapshot.data()!;
    return Customer(
      id: snapshot.id,
      name: map['name'] as String?,
      phone: map['phone'] as String?,
      address: map['address'] as String?,
      province: map['province'] as int?,
      district: (map['district'] as int?)?.toDisctrict,
      searchIndex: map['searchIndex'] as List<dynamic>?,
    );
  }

  static Map<String, dynamic> toFirestore(Customer customer, SetOptions? _) {
    return {
      'name': customer.name,
      'phone': customer.phone,
      'address': customer.address,
      'province': customer.province,
      'district': customer.district?.id,
      'searchIndex': customer.searchIndex,
    };
  }

  Customer copyWith({
    String? id,
    String? name,
    String? phone,
    String? address,
    int? province,
    District? district,
    List<dynamic>? searchIndex,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      province: province ?? this.province,
      district: district ?? this.district,
      searchIndex: searchIndex ?? this.searchIndex,
    );
  }

  final String id;
  final String? name;
  final String? phone;
  final String? address;
  final int? province;
  final District? district;
  final List<dynamic>? searchIndex;

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        address,
        province,
        district,
        searchIndex,
      ];
}
