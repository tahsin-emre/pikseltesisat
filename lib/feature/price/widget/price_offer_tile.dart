import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/price/price.dart';
import 'package:pikseltesisat/product/models/work/work_cart_item.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:pikseltesisat/product/utils/constants/app_radius.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';
import 'package:pikseltesisat/product/utils/extensions/app_sizes_ext.dart';
import 'package:pikseltesisat/product/utils/extensions/context_general_ext.dart';

final class PriceOfferTile extends StatefulWidget {
  const PriceOfferTile({
    required this.price,
    required this.onChanged,
    required this.onRemovedById,
    super.key,
  });
  final Price price;
  final ValueChanged<WorkCartItem> onChanged;
  final ValueChanged<String> onRemovedById;
  @override
  State<PriceOfferTile> createState() => _PriceOfferTileState();
}

class _PriceOfferTileState extends State<PriceOfferTile>
    with PriceOfferTileMixin {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppPaddings.horizontalS + AppPaddings.verticalXXS,
      elevation: isSelected ? 5 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.allXS,
        side: BorderSide(
          width: isSelected ? 2 : 1,
          color: isSelected
              ? context.teska.colorScheme.primary.withValues(alpha: .5)
              : Colors.grey.withValues(alpha: .25),
        ),
      ),
      child: Padding(
        padding: AppPaddings.allS,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  value: isSelected,
                  activeColor: context.teska.colorScheme.primary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppRadius.allXXS,
                  ),
                  onChanged: (value) =>
                      onCheckBoxChanged(value: value ?? false),
                ),
                AppSizes.xs.toWidth,
                Expanded(
                  child: Text(
                    widget.price.name ?? '',
                    style: context.teska.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? context.teska.colorScheme.primary
                          : context.teska.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            AppSizes.m.toHeight,
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    onChanged: onTextFieldChanged,
                    style: context.teska.textTheme.bodyMedium,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: LocaleKeys.workPriceOffer_price.tr(),
                      prefixIcon: AppIcons.prices.toIcon,
                      suffixText: 'TRY',
                      contentPadding: AppPaddings.allS,
                      border: const OutlineInputBorder(
                        borderRadius: AppRadius.allXS,
                      ),
                    ),
                  ),
                ),
                AppSizes.s.toWidth,
                Expanded(
                  child: TextField(
                    controller: countController,
                    keyboardType: TextInputType.number,
                    onChanged: onTextFieldChanged,
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: AppIcons.numbers.toIcon,
                      suffixText: LocaleKeys.workPriceOffer_count.tr(),
                      contentPadding: AppPaddings.allS,
                      border: const OutlineInputBorder(
                        borderRadius: AppRadius.allXS,
                      ),
                      labelText: LocaleKeys.workPriceOffer_count.tr(),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ValueListenableBuilder(
                  valueListenable: amountNotifier,
                  builder: (_, amount, __) {
                    final total = amount.toStringAsFixed(2);
                    return Text(
                      '${LocaleKeys.base_total.tr()}: $total ₺',
                      style: context.teska.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.teska.colorScheme.primary,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

mixin PriceOfferTileMixin on State<PriceOfferTile> {
  final priceController = TextEditingController();
  final countController = TextEditingController();
  bool isSelected = false;
  final amountNotifier = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();
    priceController.text = widget.price.recommendedPrice.toString();
    countController.text = (1).toString();
  }

  void onCheckBoxChanged({required bool value}) {
    setState(() {
      isSelected = value;
    });
    if (!isSelected) {
      widget.onRemovedById(widget.price.id);
      amountNotifier.value = 0;
      return;
    }
    final price = double.tryParse(priceController.text);
    final count = int.tryParse(countController.text);
    if (price == null || count == null) return;
    widget.onChanged(
      WorkCartItem(
        id: widget.price.id,
        price: price,
        count: count,
        title: widget.price.name,
      ),
    );
    amountNotifier.value = price * count;
  }

  void onTextFieldChanged(String value) {
    if (!isSelected) return;
    final price = double.tryParse(priceController.text);
    final count = int.tryParse(countController.text);
    if (price == null || count == null) return;
    if (price == 0 || count == 0) {
      onCheckBoxChanged(value: false);
      return;
    }
    widget.onChanged(
      WorkCartItem(
        id: widget.price.id,
        price: price,
        count: count,
        title: widget.price.name,
      ),
    );
    amountNotifier.value = price * count;
  }
}
