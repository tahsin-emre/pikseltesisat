import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

final class Customer extends Equatable {
  const Customer({
    this.id = '',
    this.name,
    this.phone,
    this.address,
    this.province,
    this.district,
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
      district: map['district'] as int?,
    );
  }

  static Map<String, dynamic> toFirestore(Customer customer, SetOptions? _) {
    return {
      'name': customer.name,
      'phone': customer.phone,
      'address': customer.address,
      'province': customer.province,
      'district': customer.district,
    };
  }

  Customer copyWith({
    String? id,
    String? name,
    String? phone,
    String? address,
    int? province,
    int? district,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      province: province ?? this.province,
      district: district ?? this.district,
    );
  }

  final String id;
  final String? name;
  final String? phone;
  final String? address;
  final int? province;
  final int? district;

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        address,
        province,
        district,
      ];
}
