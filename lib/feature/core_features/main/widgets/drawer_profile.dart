import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_cubit.dart';
import 'package:pikseltesisat/feature/core_features/auth/cubit/auth_state.dart';
import 'package:pikseltesisat/product/init/di/locator.dart';
import 'package:pikseltesisat/product/utils/constants/app_icons.dart';
import 'package:pikseltesisat/product/utils/constants/app_paddings.dart';
import 'package:pikseltesisat/product/utils/constants/app_radius.dart';
import 'package:pikseltesisat/product/utils/constants/app_sizes.dart';
import 'package:pikseltesisat/product/utils/extensions/app_sizes_ext.dart';
import 'package:pikseltesisat/product/utils/extensions/context_general_ext.dart';

final class DrawerProfile extends StatelessWidget {
  const DrawerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: locator<AuthCubit>(),
      builder: (context, state) {
        final user = state.user;
        if (user == null) return const SizedBox.shrink();

        return Container(
          padding: AppPaddings.allM,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                context.teska.colorScheme.primary,
                context.teska.colorScheme.primary.withValues(alpha: .7),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name ?? '',
                    style: context.teska.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppSizes.xxs.toHeight,
                  Container(
                    padding: AppPaddings.horizontalXS + AppPaddings.verticalXXS,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: .3),
                      borderRadius: AppRadius.allXS,
                    ),
                    child: Text(
                      user.userType.title,
                      style: context.teska.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              AppSizes.l.toHeight,
              const _Statistics(),
            ],
          ),
        );
      },
    );
  }
}

final class _Statistics extends StatelessWidget {
  const _Statistics();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allXS,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .15),
        borderRadius: AppRadius.allS,
      ),
      child: Column(
        children: [
          const _StatRow(
            icon: AppIcons.works,
            title: 'Toplam İş',
            value: '24',
          ),
          AppSizes.xs.toHeight,
          const _StatRow(
            icon: AppIcons.customers,
            title: 'Müşteriler',
            value: '18',
          ),
          AppSizes.xs.toHeight,
          const _StatRow(
            icon: AppIcons.calendar,
            title: 'Bu Ay',
            value: '7 iş',
          ),
        ],
      ),
    );
  }
}

final class _StatRow extends StatelessWidget {
  const _StatRow({
    required this.icon,
    required this.title,
    required this.value,
  });
  final IconData icon;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.white.withValues(alpha: .9),
        ),
        AppSizes.xs.toWidth,
        Text(
          title,
          style: context.teska.textTheme.bodyMedium?.copyWith(
            color: Colors.white.withValues(alpha: .9),
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: context.teska.textTheme.bodyMedium?.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
