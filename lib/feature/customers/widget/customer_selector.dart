import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/customer/customer.dart';
import 'package:pikseltesisat/product/services/customer_service.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:skeletonizer/skeletonizer.dart';

final class CustomerSelector extends StatefulWidget {
  const CustomerSelector(this.onChanged, {super.key});
  final ValueChanged<Customer?> onChanged;
  @override
  State<CustomerSelector> createState() => _CustomerSelectorState();
}

class _CustomerSelectorState extends State<CustomerSelector> {
  final loadingNotifier = ValueNotifier<bool>(false);
  final _customerService = CustomerService();
  final List<Customer?> _customers = [];
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
                labelText: LocaleKeys.customer_customerPick.tr(),
                border: const OutlineInputBorder(),
              ),
              items: _customers
                  .map(
                    (e) => DropdownMenuItem<Customer>(
                      value: e,
                      child: _CustomerRow(e),
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
    final response = await _customerService.customerCollection.get();
    for (final item in response.docs) {
      _customers.add(item.data());
    }
    loadingNotifier.value = false;
  }
}

final class _CustomerRow extends StatelessWidget {
  const _CustomerRow(this.customer);
  final Customer? customer;
  @override
  Widget build(BuildContext context) {
    return Text(customer?.name ?? LocaleKeys.customer_customerPick.tr());
  }
}
