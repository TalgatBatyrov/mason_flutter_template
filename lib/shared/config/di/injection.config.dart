// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:test_app/feature/auth/data/repositories/auth_repository.dart'
    as _i6;
import 'package:test_app/feature/auth/domain/interactors/auth_interactor.dart'
    as _i9;
import 'package:test_app/feature/auth/presentation/BLoCs/auth_bloc.dart' as _i8;
import 'package:test_app/feature/home/data/repositories/home_repository.dart'
    as _i5;
import 'package:test_app/feature/home/presentation/BLoCs/home_bloc.dart'
    as _i11;
import 'package:test_app/feature/lola/data/repositories/lola_repository.dart'
    as _i7;
import 'package:test_app/feature/lola/domain/interactors/kaif_interactor.dart'
    as _i13;
import 'package:test_app/feature/lola/domain/interactors/lola_interactor.dart'
    as _i12;
import 'package:test_app/feature/lola/presentation/BLoCs/lola_bloc.dart'
    as _i14;
import 'package:test_app/feature/lola/presentation/BLoCs/make/make_bloc.dart'
    as _i10;
import 'package:test_app/shared/config/api_service/api_client.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ApiClient>(() => _i3.ApiClient());
    gh.factory<_i5.HomeRepository>(
        () => _i5.HomeRepository(gh<_i3.ApiClient>()));
    gh.factory<_i6.AuthRepository>(
        () => _i6.AuthRepository(gh<_i3.ApiClient>()));
    gh.factory<_i7.LolaRepository>(
        () => _i7.LolaRepository(gh<_i3.ApiClient>()));
    gh.factory<_i8.AuthBloc>(() => _i8.AuthBloc(gh<_i6.AuthRepository>()));
    gh.factory<_i9.AuthInteractor>(
        () => _i9.AuthInteractor(gh<_i6.AuthRepository>()));
    gh.factory<_i10.MakeBloc>(() => _i10.MakeBloc(gh<_i7.LolaRepository>()));
    gh.factory<_i11.HomeBloc>(() => _i11.HomeBloc(gh<_i5.HomeRepository>()));
    gh.factory<_i12.LolaInteractor>(
        () => _i12.LolaInteractor(gh<_i7.LolaRepository>()));
    gh.factory<_i13.KaifInteractor>(
        () => _i13.KaifInteractor(gh<_i7.LolaRepository>()));
    gh.factory<_i14.LolaBloc>(() => _i14.LolaBloc(gh<_i12.LolaInteractor>()));
    return this;
  }
}
