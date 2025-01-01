import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_state.dart';
import 'package:pikseltesisat/product/services/auth_service.dart';

final class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  final _authService = AuthService();

  Future<void> findCurrentUser() async {
    final user = await _authService.getUser();
    emit(state.copyWith(user: user));
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    final errorResponse = await _authService.login(email, password);
    if (errorResponse != null) return errorResponse;
    final user = await _authService.getUser();
    emit(state.copyWith(user: user));
    return null;
  }

  Future<String?> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final errorResponse = await _authService.register(email, password);
    if (errorResponse != null) return errorResponse;
    final userErrorResponse = await _authService.createUser(name: name);
    if (userErrorResponse != null) return userErrorResponse;
    final user = await _authService.getUser();
    emit(state.copyWith(user: user));
    return null;
  }

  Future<void> logout() async {
    await _authService.logout();
    emit(const AuthState());
  }
}
