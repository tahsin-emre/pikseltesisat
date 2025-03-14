import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pikseltesisat/feature/core_features/splash/cubit/splash_state.dart';
import 'package:pikseltesisat/feature/price/cubit/price_cubit.dart';
import 'package:pikseltesisat/firebase_options.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';

/// Uygulama başlatıldı mı kontrolü
bool _isAppInitialized = false;

/// Splash screen cubit
@injectable
class SplashCubit extends Cubit<SplashState> {
  /// Default constructor
  SplashCubit() : super(const SplashState());

  /// Initialize the app
  Future<void> initialize() async {
    try {
      final startTime = DateTime.now();
      if (!_isAppInitialized) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        await configureDependencies(environment: Env.dev);
        await locator<PriceCubit>().getPrices();
        _isAppInitialized = true;
      }

      final endTime = DateTime.now();
      final difference = endTime.difference(startTime).inMilliseconds;
      final remainingTime = 2000 - difference;

      if (remainingTime > 0) {
        await Future<void>.delayed(Duration(milliseconds: remainingTime));
      }

      emit(state.copyWith(isInitialized: true, isLoading: false));
    } on Exception catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
      debugPrint('Initialization error: $e');
    }
  }
}
