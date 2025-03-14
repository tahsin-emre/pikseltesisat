import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'personal.g.dart';

@JsonSerializable()
final class Personal extends Equatable {
  const Personal({
    required this.id,
    this.name,
  });

  factory Personal.fromJson(Map<String, dynamic> json) =>
      _$PersonalFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalToJson(this);

  Personal copyWith({
    String? id,
    String? name,
  }) {
    return Personal(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @JsonKey(defaultValue: '')
  final String id;
  final String? name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
