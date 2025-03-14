import 'package:flutter/material.dart';
import 'package:pikseltesisat/app.dart';
import 'package:pikseltesisat/product/init/localization/localization_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Run app with localization
  runApp(LocalizationManager.app(const App()));
}
