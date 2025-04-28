import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DrawerLanguage extends StatelessWidget {
  const DrawerLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final isTurkish = context.locale == const Locale('tr');
    return SwitchListTile(
      title: const Text('Language'),
      subtitle: Text(isTurkish ? 'Turkish' : 'İngilizce'),
      value: isTurkish,
      activeColor: Theme.of(context).primaryColor,
      inactiveTrackColor: Theme.of(context).colorScheme.surface,
      activeTrackColor: Theme.of(context).primaryColor.withValues(alpha: .3),
      activeThumbImage: const AssetImage('assets/images/tr.png'),
      inactiveThumbImage: const AssetImage('assets/images/uk.png'),
      onChanged: (bool value) {
        context.setLocale(value ? const Locale('tr') : const Locale('en'));
      },
    );
  }
}
