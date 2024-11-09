import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'appuser.g.dart';

@JsonSerializable()
final class Appuser extends Equatable {
  const Appuser({
    required this.id,
    this.name,
  });

  factory Appuser.fromJson(Map<String, dynamic> json) =>
      _$AppuserFromJson(json);

  Map<String, dynamic>? toJson() => _$AppuserToJson(this);

  Appuser copyWith({
    String? id,
    String? name,
  }) {
    return Appuser(
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
