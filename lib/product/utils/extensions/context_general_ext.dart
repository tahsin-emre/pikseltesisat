import 'package:flutter/material.dart';

/// [teska] is a helper extension to access the general context properties.
extension ContextGeneralExt on BuildContext {
  _ContextGeneralExt get teska => _ContextGeneralExt(this);
}

final class _ContextGeneralExt {
  const _ContextGeneralExt(BuildContext context) : _context = context;
  final BuildContext _context;

  ColorScheme get colorScheme => Theme.of(_context).colorScheme;
  TextTheme get textTheme => Theme.of(_context).textTheme;
}
