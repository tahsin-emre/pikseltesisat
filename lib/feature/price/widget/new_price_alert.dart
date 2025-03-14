import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/feature/sub_features/ui_kit/custom_text_field.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/price/price.dart';

final class NewPriceAlert extends StatefulWidget {
  const NewPriceAlert({super.key});

  @override
  State<NewPriceAlert> createState() => _NewPriceAlertState();
}

class _NewPriceAlertState extends State<NewPriceAlert> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController recommendedPriceController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LocaleKeys.price_newPrice.tr()),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            label: LocaleKeys.price_name.tr(),
            controller: nameController,
          ),
          CustomTextField(
            label: LocaleKeys.price_recommendedPrice.tr(),
            controller: recommendedPriceController,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, price),
          child: Text(LocaleKeys.base_save.tr()),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(LocaleKeys.base_cancel.tr()),
        ),
      ],
    );
  }

  Price? get price {
    if (nameController.text.isEmpty) return null;
    final recommendedPrice = num.tryParse(recommendedPriceController.text);
    if (recommendedPrice == null) return null;
    return Price(
      id: '',
      name: nameController.text,
      recommendedPrice: recommendedPrice,
    );
  }
}
