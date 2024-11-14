import 'package:equatable/equatable.dart';

final class District extends Equatable {
  const District({
    required this.id,
    required this.provinceId,
    required this.name,
  });

  final int id;
  final int provinceId;
  final String name;

  @override
  List<Object?> get props => [id, provinceId, name];
}
