import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'district.g.dart';

@JsonSerializable()
final class District extends Equatable {
  const District({
    required this.id,
    required this.provinceId,
    required this.name,
  });

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);

  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: 0)
  final int provinceId;
  @JsonKey(defaultValue: '')
  final String name;

  @override
  List<Object?> get props => [id, provinceId, name];
}
