import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pikseltesisat/app.dart';
import 'package:pikseltesisat/product/init/localization/localization_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load();

  // Initialize localization
  await EasyLocalization.ensureInitialized();

  // Run app with localization
  runApp(LocalizationManager.app(const App()));
}
