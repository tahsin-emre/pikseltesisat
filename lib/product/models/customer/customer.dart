import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pikseltesisat/product/models/customer/district.dart';
import 'package:pikseltesisat/product/models/customer/province.dart';
import 'package:pikseltesisat/product/models/firebase_model_helper.dart';

part 'customer.g.dart';

@JsonSerializable(explicitToJson: true)
final class Customer extends Equatable {
  const Customer({
    required this.id,
    this.name,
    this.phone,
    this.address,
    this.province,
    this.district,
    this.searchIndex,
    this.createdAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  Customer copyWith({
    String? id,
    String? name,
    String? phone,
    String? address,
    Province? province,
    District? district,
    List<String>? searchIndex,
    DateTime? createdAt,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      province: province ?? this.province,
      district: district ?? this.district,
      searchIndex: searchIndex ?? this.searchIndex,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @JsonKey(defaultValue: '')
  final String id;
  final String? name;
  final String? phone;
  final String? address;
  final List<String>? searchIndex;
  @JsonKey(
    fromJson: FirebaseModelHelper.provinceFromInt,
    toJson: FirebaseModelHelper.provinceToInt,
  )
  final Province? province;
  @JsonKey(
    fromJson: FirebaseModelHelper.districtFromInt,
    toJson: FirebaseModelHelper.districtToInt,
  )
  final District? district;
  @JsonKey(
    fromJson: FirebaseModelHelper.timestampToDateTime,
    toJson: FirebaseModelHelper.dateTimeToTimestamp,
  )
  final DateTime? createdAt;

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        address,
        province,
        district,
        searchIndex,
        createdAt,
      ];
}
