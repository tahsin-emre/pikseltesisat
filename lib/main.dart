import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/app.dart';
import 'package:pikseltesisat/firebase_options.dart';
import 'package:pikseltesisat/product/init/localization/localization_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();

  runApp(LocalizationManager.app(const App()));
}
