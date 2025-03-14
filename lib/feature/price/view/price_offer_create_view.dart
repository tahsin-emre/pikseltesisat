import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/price/cubit/price_cubit.dart';
import 'package:pikseltesisat/feature/price/cubit/price_state.dart';
import 'package:pikseltesisat/feature/price/mixin/price_offer_create_mixin.dart';
import 'package:pikseltesisat/feature/price/widget/price_offer_tile.dart';
import 'package:pikseltesisat/feature/sub_features/ui_kit/base_app_bar.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/work/work_cart_item.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class PriceOfferCreateView extends StatefulWidget {
  const PriceOfferCreateView({required this.workCart, super.key});
  final List<WorkCartItem> workCart;
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
            valueListenable: workCartNotifier,
            builder: (_, workCartList, __) {
              num total = 0;
              for (final item in workCartList) {
                total += (item.price ?? 0) * (item.count ?? 0);
              }
              return Text('$total ₺');
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
              _ServiceTile(item: widget.workCart.first).toSliver,
              SliverList.separated(
                itemBuilder: (context, index) => PriceOfferTile(
                  price: state.prices![index],
                  onChanged: updateList,
                  onRemovedById: removeItem,
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

final class _ServiceTile extends StatelessWidget {
  const _ServiceTile({required this.item});
  final WorkCartItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: false,
      leading: Checkbox(
        value: true,
        onChanged: (value) {},
      ),
      title: Text(item.title ?? ''),
      trailing: Text('${item.price} ₺'),
      subtitle: Text('${item.count} ${LocaleKeys.workPriceOffer_count.tr()}'),
    );
  }
}
