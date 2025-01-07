import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/plumber/plumber.dart';
import 'package:pikseltesisat/product/services/plumber_service.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:skeletonizer/skeletonizer.dart';

final class PlumberSelector extends StatefulWidget {
  const PlumberSelector(this.onChanged, {super.key});
  final ValueChanged<Plumber?> onChanged;

  @override
  State<PlumberSelector> createState() => _PlumberSelectorState();
}

class _PlumberSelectorState extends State<PlumberSelector> {
  final loadingNotifier = ValueNotifier<bool>(false);
  final _plumberService = PlumberService();
  final List<Plumber?> _plumbers = [];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loadingNotifier,
      builder: (_, isLoading, __) {
        return Container(
          padding: AppPaddings.allXS,
          child: Skeletonizer(
            enabled: isLoading,
            child: DropdownButtonFormField(
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                labelText: LocaleKeys.plumber_pickPlumber.tr(),
                border: const OutlineInputBorder(),
              ),
              items: _plumbers
                  .map(
                    (e) => DropdownMenuItem<Plumber>(
                      value: e,
                      child: _PlumberRow(e),
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
    Future.microtask(fetchPlumbers);
  }

  Future<void> fetchPlumbers() async {
    loadingNotifier.value = true;
    final response = await _plumberService.plumberCollection.get();
    for (final item in response.docs) {
      _plumbers.add(item.data());
    }
    _plumbers.insert(0, null);
    loadingNotifier.value = false;
  }
}

final class _PlumberRow extends StatelessWidget {
  const _PlumberRow(this.plumber);
  final Plumber? plumber;
  @override
  Widget build(BuildContext context) {
    return Text(plumber?.name ?? LocaleKeys.base_pickLater.tr());
  }
}
