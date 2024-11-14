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

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      name: map['name'] as String?,
      phone: map['phone'] as String?,
      address: map['address'] as String?,
      province: map['province'] as int?,
      district: map['district'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'province': province,
      'district': district,
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
