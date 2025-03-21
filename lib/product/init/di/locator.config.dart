// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../feature/core_features/auth/cubit/auth_cubit.dart' as _i715;
import '../../../feature/core_features/splash/cubit/splash_cubit.dart' as _i227;
import '../../../feature/price/cubit/price_cubit.dart' as _i698;
import '../../services/auth_service.dart' as _i610;
import '../../services/customer_service.dart' as _i105;
import '../../services/personal_service.dart' as _i992;
import '../../services/price_service.dart' as _i433;
import '../../services/work_service.dart' as _i487;
import 'modules/auth_module.dart' as _i4;
import 'modules/firebase_module.dart' as _i398;
import 'modules/price_module.dart' as _i310;
import 'modules/service_module.dart' as _i681;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    final serviceModule = _$ServiceModule();
    final priceModule = _$PriceModule();
    final authModule = _$AuthModule();
    gh.factory<_i227.SplashCubit>(() => _i227.SplashCubit());
    gh.singleton<_i974.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.singleton<_i59.FirebaseAuth>(() => firebaseModule.auth);
    gh.singleton<_i457.FirebaseStorage>(() => firebaseModule.storage);
    gh.singleton<_i105.CustomerService>(
        () => serviceModule.provideCustomerService(
              gh<_i974.FirebaseFirestore>(),
              gh<_i59.FirebaseAuth>(),
              gh<_i457.FirebaseStorage>(),
            ));
    gh.singleton<_i992.PersonalService>(
        () => serviceModule.providePersonalService(
              gh<_i974.FirebaseFirestore>(),
              gh<_i59.FirebaseAuth>(),
              gh<_i457.FirebaseStorage>(),
            ));
    gh.singleton<_i487.WorkService>(() => serviceModule.provideWorkService(
          gh<_i974.FirebaseFirestore>(),
          gh<_i59.FirebaseAuth>(),
          gh<_i457.FirebaseStorage>(),
        ));
    gh.singleton<_i433.PriceService>(() => priceModule.providePriceService(
          gh<_i974.FirebaseFirestore>(),
          gh<_i59.FirebaseAuth>(),
          gh<_i457.FirebaseStorage>(),
        ));
    gh.singleton<_i610.AuthService>(() => authModule.provideAuthService(
          gh<_i974.FirebaseFirestore>(),
          gh<_i59.FirebaseAuth>(),
          gh<_i457.FirebaseStorage>(),
        ));
    gh.singleton<_i715.AuthCubit>(
        () => authModule.provideAuthCubit(gh<_i610.AuthService>()));
    gh.singleton<_i698.PriceCubit>(
        () => priceModule.providePriceCubit(gh<_i433.PriceService>()));
    return this;
  }
}

class _$FirebaseModule extends _i398.FirebaseModule {}

class _$ServiceModule extends _i681.ServiceModule {}

class _$PriceModule extends _i310.PriceModule {}

class _$AuthModule extends _i4.AuthModule {}
