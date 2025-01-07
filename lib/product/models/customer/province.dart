import 'package:equatable/equatable.dart';
import 'package:pikseltesisat/product/models/customer/district.dart';

final class Province extends Equatable {
  const Province({
    required this.id,
    required this.name,
    required this.districts,
  });

  final int id;
  final String name;
  final List<District> districts;

  @override
  List<Object?> get props => [id, name, districts];
}
