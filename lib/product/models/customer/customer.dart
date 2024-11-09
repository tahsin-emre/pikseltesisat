import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'customer.g.dart';

@JsonSerializable()
final class Customer extends Equatable {
  const Customer({
    required this.id,
    this.name,
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic>? toJson() => _$CustomerToJson(this);

  Customer copyWith({
    String? id,
    String? name,
  }) {
    return Customer(
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
