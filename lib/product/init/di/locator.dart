import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pikseltesisat/product/init/di/locator.config.dart';

/// Global service locator instance
final locator = GetIt.instance;

/// Configures the dependency injection container
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
  usesNullSafety: true, // required for null safety
)
Future<void> configureDependencies({String? environment}) async {
  locator.init(environment: environment);
}

/// Environment constants for conditional registration
abstract class Env {
  /// Development environment
  static const dev = 'dev';

  /// Production environment
  static const prod = 'prod';

  /// Test environment
  static const test = 'test';
}
