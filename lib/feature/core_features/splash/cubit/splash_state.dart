import 'package:equatable/equatable.dart';

/// Splash screen state
class SplashState extends Equatable {
  /// Default constructor
  const SplashState({
    this.isInitialized = false,
    this.isLoading = true,
    this.error,
  });

  /// Whether the app is initialized
  final bool isInitialized;

  /// Whether the app is loading
  final bool isLoading;

  /// Error message if any
  final String? error;

  @override
  List<Object?> get props => [isInitialized, isLoading, error];

  /// Copy with method
  SplashState copyWith({
    bool? isInitialized,
    bool? isLoading,
    String? error,
  }) {
    return SplashState(
      isInitialized: isInitialized ?? this.isInitialized,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
