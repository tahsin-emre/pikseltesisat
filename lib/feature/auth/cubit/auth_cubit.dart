import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/auth/cubit/auth_state.dart';

final class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void login() {}

  void logout() => emit(const AuthState());
}
