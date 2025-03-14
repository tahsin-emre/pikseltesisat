import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/price/cubit/price_cubit.dart';
import 'package:pikseltesisat/feature/price/cubit/price_state.dart';
import 'package:pikseltesisat/feature/price/mixin/price_list_mixin.dart';
import 'package:pikseltesisat/feature/sub_features/common_widgets/new_element_tile.dart';
import 'package:pikseltesisat/product/init/localization/locale_keys.g.dart';
import 'package:pikseltesisat/product/models/price/price.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/extensions/widget_ext.dart';

final class PriceListView extends StatefulWidget {
  const PriceListView({super.key});

  @override
  State<PriceListView> createState() => _PriceListViewState();
}

class _PriceListViewState extends State<PriceListView> with PriceListMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceCubit, PriceState>(
      bloc: priceCubit,
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            NewElementTile(
              icon: AppIcons.add.toIcon,
              title: LocaleKeys.price_newPrice.tr(),
              onTap: onTap,
            ).toSliver,
            if (state.prices != null)
              SliverList.separated(
                itemBuilder: (context, index) =>
                    _PriceRow(price: state.prices![index]),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.prices!.length,
              ),
          ],
        );
      },
    );
  }
}

final class _PriceRow extends StatelessWidget {
  const _PriceRow({required this.price});
  final Price price;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(price.name ?? ''),
      subtitle: Text(price.recommendedPrice.toString()),
    );
  }
}
