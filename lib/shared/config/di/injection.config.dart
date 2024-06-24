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
import 'package:test_app/app/routes/app_routes.dart' as _i23;
import 'package:test_app/feature/home/data/repositories/home_repository_impl.dart'
    as _i8;
import 'package:test_app/feature/home/data/repositories/joke/joke_repository_impl.dart'
    as _i6;
import 'package:test_app/feature/home/domain/interactors/home_interactor.dart'
    as _i15;
import 'package:test_app/feature/home/domain/interactors/joke_interactor.dart'
    as _i11;
import 'package:test_app/feature/home/domain/repositories/home_repository_interface.dart'
    as _i7;
import 'package:test_app/feature/home/domain/repositories/joke/joke_repository_interface.dart'
    as _i5;
import 'package:test_app/feature/home/presentation/BLoCs/home_bloc.dart'
    as _i18;
import 'package:test_app/feature/home/presentation/BLoCs/joke/joke_bloc.dart'
    as _i12;
import 'package:test_app/feature/other/data/repositories/other_repository.dart'
    as _i13;
import 'package:test_app/feature/other/domain/interactors/other_interactor.dart'
    as _i21;
import 'package:test_app/feature/other/presentation/BLoCs/other_bloc.dart'
    as _i22;
import 'package:test_app/feature/piramida/data/repositories/piramida_repository_impl.dart'
    as _i10;
import 'package:test_app/feature/piramida/domain/interactors/piramida_interactor.dart'
    as _i16;
import 'package:test_app/feature/piramida/domain/repositories/piramida_repository_interface.dart'
    as _i9;
import 'package:test_app/feature/piramida/presentation/BLoCs/piramida_bloc.dart'
    as _i17;
import 'package:test_app/feature/profile/data/repositories/profile_repository.dart'
    as _i14;
import 'package:test_app/feature/profile/domain/interactors/profile_interactor.dart'
    as _i19;
import 'package:test_app/feature/profile/presentation/BLoCs/profile_bloc.dart'
    as _i20;
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
    gh.singleton<_i5.JokeRepositoryInterface>(
        () => const _i6.JokeRepositoryImpl());
    gh.singleton<_i7.HomeRepositoryInterface>(
        () => const _i8.HomeRepositoryImpl());
    gh.singleton<_i9.PiramidaRepositoryInterface>(
        () => const _i10.PiramidaRepositoryImpl());
    gh.singleton<_i11.JokeInteractor>(() =>
        _i11.JokeInteractor(repository: gh<_i5.JokeRepositoryInterface>()));
    gh.factory<_i12.JokeBloc>(
        () => _i12.JokeBloc(jokeInteractor: gh<_i11.JokeInteractor>()));
    gh.factory<_i13.OtherRepository>(
        () => _i13.OtherRepository(gh<_i3.ApiClient>()));
    gh.factory<_i14.ProfileRepository>(
        () => _i14.ProfileRepository(gh<_i3.ApiClient>()));
    gh.singleton<_i15.HomeInteractor>(() =>
        _i15.HomeInteractor(repository: gh<_i7.HomeRepositoryInterface>()));
    gh.singleton<_i16.PiramidaInteractor>(() => _i16.PiramidaInteractor(
        repository: gh<_i9.PiramidaRepositoryInterface>()));
    gh.factory<_i17.PiramidaBloc>(() =>
        _i17.PiramidaBloc(piramidaInteractor: gh<_i16.PiramidaInteractor>()));
    gh.factory<_i18.HomeBloc>(
        () => _i18.HomeBloc(homeInteractor: gh<_i15.HomeInteractor>()));
    gh.singleton<_i19.ProfileInteractor>(
        () => _i19.ProfileInteractor(gh<_i14.ProfileRepository>()));
    gh.factory<_i20.ProfileBloc>(
        () => _i20.ProfileBloc(gh<_i19.ProfileInteractor>()));
    gh.singleton<_i21.OtherInteractor>(
        () => _i21.OtherInteractor(gh<_i13.OtherRepository>()));
    gh.factory<_i22.OtherBloc>(
        () => _i22.OtherBloc(gh<_i21.OtherInteractor>()));
    return this;
  }
}

class _$AppRoutes extends _i23.AppRoutes {}
