import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/price/cubit/price_cubit.dart';
import 'package:pikseltesisat/feature/price/cubit/price_state.dart';
import 'package:pikseltesisat/feature/price/mixin/price_offer_create_mixin.dart';
import 'package:pikseltesisat/feature/sub_features/ui_kit/base_app_bar.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/price/price.dart';

final class PriceOfferCreateView extends StatefulWidget {
  const PriceOfferCreateView({super.key});

  @override
  State<PriceOfferCreateView> createState() => _PriceOfferCreateViewState();
}

class _PriceOfferCreateViewState extends State<PriceOfferCreateView>
    with PriceOfferCreateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: LocaleKeys.workPriceOffer_title.tr(),
        actions: [
          ValueListenableBuilder(
            valueListenable: amountNotifier,
            builder: (_, amount, __) {
              return Text('$amount ₺');
            },
          ),
          TextButton(
            onPressed: createOffer,
            child: Text(LocaleKeys.base_confirm.tr()),
          ),
        ],
      ),
      body: BlocBuilder<PriceCubit, PriceState>(
        bloc: priceCubit,
        builder: (_, state) {
          return CustomScrollView(
            slivers: [
              SliverList.separated(
                itemBuilder: (context, index) => _PriceTile(
                  price: state.prices![index],
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.prices?.length ?? 0,
              ),
            ],
          );
        },
      ),
    );
  }
}

final class _PriceTile extends StatelessWidget {
  const _PriceTile({required this.price});
  final Price price;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: false,
        onChanged: (value) {},
      ),
      title: Text(price.name ?? ''),
      trailing: Text('${price.recommendedPrice} ₺'),
    );
  }
}
