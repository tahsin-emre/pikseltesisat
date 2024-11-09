import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'plumber.g.dart';

@JsonSerializable()
final class Plumber extends Equatable {
  const Plumber({
    required this.id,
    this.name,
  });

  factory Plumber.fromJson(Map<String, dynamic> json) =>
      _$PlumberFromJson(json);

  Map<String, dynamic>? toJson() => _$PlumberToJson(this);

  Plumber copyWith({
    String? id,
    String? name,
  }) {
    return Plumber(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @JsonKey(defaultValue: '')
  final String id;
  final String? name;

  @override
  List<Object?> get props => [id, name];
}
