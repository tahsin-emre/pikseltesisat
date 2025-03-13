import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_state.dart';
import 'package:pikseltesisat/product/services/auth_service.dart';

/// Cubit for handling authentication state
final class AuthCubit extends Cubit<AuthState> {
  /// Constructor with dependency injection
  AuthCubit({
    required AuthService authService,
  })  : _authService = authService,
        super(const AuthState());

  final AuthService _authService;

  /// Find and set the current user
  Future<void> findCurrentUser() async {
    final user = await _authService.getUser();
    emit(state.copyWith(user: user));
  }

  /// Login with email and password
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

  /// Register with email, password and name
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

  /// Logout current user
  Future<void> logout() async {
    await _authService.logout();
    emit(const AuthState());
  }
}
