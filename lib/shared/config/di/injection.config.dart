// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:go_router/go_router.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:test_app/app/routes/app_routes.dart' as _i9;
import 'package:test_app/feature/home/data/repositories/home_repository_impl.dart'
    as _i6;
import 'package:test_app/feature/home/domain/interactors/home_interactor.dart'
    as _i7;
import 'package:test_app/feature/home/domain/repositories/home_repository_interface.dart'
    as _i5;
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
    final appRoutes = _$AppRoutes();
    gh.factory<_i3.ApiClient>(() => _i3.ApiClient());
    gh.singleton<_i4.GoRouter>(() => appRoutes.provideGoRouter());
    gh.singleton<_i5.HomeRepositoryInterface>(
        () => const _i6.HomeRepositoryImpl());
    gh.singleton<_i7.HomeInteractor>(() =>
        _i7.HomeInteractor(repository: gh<_i5.HomeRepositoryInterface>()));
    gh.factory<_i8.HomeBloc>(
        () => _i8.HomeBloc(homeInteractor: gh<_i7.HomeInteractor>()));
    return this;
  }
}

class _$AppRoutes extends _i9.AppRoutes {}
