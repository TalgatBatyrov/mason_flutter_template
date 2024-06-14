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
    as _i5;
import 'package:test_app/feature/auth/domain/interactors/auth_interactor.dart'
    as _i6;
import 'package:test_app/feature/auth/presentation/BLoCs/auth_bloc.dart' as _i7;
import 'package:test_app/feature/home/data/repositories/home_repository.dart'
    as _i4;
import 'package:test_app/feature/home/presentation/BLoCs/home_bloc.dart' as _i8;
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
    gh.factory<_i4.HomeRepository>(
        () => _i4.HomeRepository(gh<_i3.ApiClient>()));
    gh.factory<_i5.AuthRepository>(
        () => _i5.AuthRepository(gh<_i3.ApiClient>()));
    gh.singleton<_i6.AuthInteractor>(
        () => _i6.AuthInteractor(gh<_i5.AuthRepository>()));
    gh.factory<_i7.AuthBloc>(() => _i7.AuthBloc(gh<_i6.AuthInteractor>()));
    gh.factory<_i8.HomeBloc>(() => _i8.HomeBloc(gh<_i4.HomeRepository>()));
    return this;
  }
}
