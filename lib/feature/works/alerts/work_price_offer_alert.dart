import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';

class WorkPriceOfferAlert extends StatefulWidget {
  const WorkPriceOfferAlert({super.key});

  @override
  State<WorkPriceOfferAlert> createState() => _WorkPriceOfferAlertState();
}

class _WorkPriceOfferAlertState extends State<WorkPriceOfferAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.workPriceOffer_title.tr()),
      ),
    );
  }
}
