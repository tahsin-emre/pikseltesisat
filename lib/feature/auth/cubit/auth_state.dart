import 'package:equatable/equatable.dart';
import 'package:pikseltesisat/product/models/my_user/my_user.dart';

final class AuthState extends Equatable {
  const AuthState({this.user});

  AuthState copyWith({
    MyUser? user,
  }) {
    return AuthState(
      user: user ?? this.user,
    );
  }

  final MyUser? user;

  @override
  List<Object?> get props => [user];
}
