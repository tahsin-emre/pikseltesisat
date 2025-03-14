import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/price/price.dart';
import 'package:pikseltesisat/product/models/work/work_cart_item.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

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
    return ListTile(
      leading: Checkbox(
        value: isSelected,
        onChanged: (value) => onCheckBoxChanged(value: value ?? false),
      ),
      title: Row(
        children: [
          Text(widget.price.name ?? ''),
          TextField(
            controller: priceController,
            keyboardType: TextInputType.number,
            onChanged: onTextFieldChanged,
            decoration: InputDecoration(
              labelText: LocaleKeys.workPriceOffer_price.tr(),
              border: const OutlineInputBorder(),
              suffixText: '₺',
            ),
          ).expanded,
          TextField(
            controller: countController,
            keyboardType: TextInputType.number,
            onChanged: onTextFieldChanged,
            decoration: InputDecoration(
              labelText: LocaleKeys.workPriceOffer_count.tr(),
              border: const OutlineInputBorder(),
              suffixText: 'Adet',
            ),
          ).expanded,
        ],
      ),
    );
  }
}

mixin PriceOfferTileMixin on State<PriceOfferTile> {
  final priceController = TextEditingController();
  final countController = TextEditingController();
  bool isSelected = false;

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
  }
}
