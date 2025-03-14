import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/personal/personal.dart';
import 'package:pikseltesisat/product/services/personal_service.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Widget for selecting a personal
final class PersonalSelector extends StatefulWidget {
  /// Constructor
  const PersonalSelector(this.onChanged, {super.key});

  /// Callback when a personal is selected
  final ValueChanged<Personal?> onChanged;

  @override
  State<PersonalSelector> createState() => _PersonalSelectorState();
}

class _PersonalSelectorState extends State<PersonalSelector> {
  final loadingNotifier = ValueNotifier<bool>(false);
  final _personalService = locator<PersonalService>();
  final List<Personal?> _personals = [];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loadingNotifier,
      builder: (_, isLoading, __) {
        return Container(
          padding: AppPaddings.allXXS,
          child: Skeletonizer(
            enabled: isLoading,
            child: DropdownButtonFormField<Personal>(
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                labelText: LocaleKeys.personal_pickPersonal.tr(),
                border: const OutlineInputBorder(),
              ),
              items: _personals
                  .map(
                    (e) => DropdownMenuItem<Personal>(
                      value: e,
                      child: _PersonalRow(e),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(fetchPersonals);
  }

  Future<void> fetchPersonals() async {
    loadingNotifier.value = true;
    final response = await _personalService.personalCollection.get();
    for (final item in response.docs) {
      _personals.add(item.data());
    }
    _personals.insert(0, null);
    loadingNotifier.value = false;
    if (mounted) setState(() {});
  }
}

final class _PersonalRow extends StatelessWidget {
  const _PersonalRow(this.personal);
  final Personal? personal;
  @override
  Widget build(BuildContext context) {
    return Text(personal?.name ?? LocaleKeys.base_pickLater.tr());
  }
}
