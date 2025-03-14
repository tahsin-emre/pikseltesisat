import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pikseltesisat/product/models/customer/district.dart';

part 'province.g.dart';

@JsonSerializable()
final class Province extends Equatable {
  const Province({
    required this.id,
    required this.name,
    required this.districts,
  });

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);

  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: [])
  final List<District> districts;

  @override
  List<Object?> get props => [id, name, districts];
}
