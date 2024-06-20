// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:test_app/feature/home/data/repositories/home_repository_impl.dart'
    as _i5;
import 'package:test_app/feature/home/domain/interactors/home_interactor.dart'
    as _i10;
import 'package:test_app/feature/home/domain/repositories/home_repository_interface.dart'
    as _i4;
import 'package:test_app/feature/home/presentation/BLoCs/home_bloc.dart'
    as _i13;
import 'package:test_app/feature/other/data/repositories/other_repository.dart'
    as _i8;
import 'package:test_app/feature/other/domain/interactors/other_interactor.dart'
    as _i16;
import 'package:test_app/feature/other/presentation/BLoCs/other_bloc.dart'
    as _i17;
import 'package:test_app/feature/piramida/data/repositories/piramida_repository_impl.dart'
    as _i7;
import 'package:test_app/feature/piramida/domain/interactors/piramida_interactor.dart'
    as _i11;
import 'package:test_app/feature/piramida/domain/repositories/piramida_repository_interface.dart'
    as _i6;
import 'package:test_app/feature/piramida/presentation/BLoCs/piramida_bloc.dart'
    as _i12;
import 'package:test_app/feature/profile/data/repositories/profile_repository.dart'
    as _i9;
import 'package:test_app/feature/profile/domain/interactors/profile_interactor.dart'
    as _i14;
import 'package:test_app/feature/profile/presentation/BLoCs/profile_bloc.dart'
    as _i15;
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
    gh.singleton<_i4.HomeRepositoryInterface>(
        () => const _i5.HomeRepositoryImpl());
    gh.singleton<_i6.PiramidaRepositoryInterface>(
        () => const _i7.PiramidaRepositoryImpl());
    gh.factory<_i8.OtherRepository>(
        () => _i8.OtherRepository(gh<_i3.ApiClient>()));
    gh.factory<_i9.ProfileRepository>(
        () => _i9.ProfileRepository(gh<_i3.ApiClient>()));
    gh.singleton<_i10.HomeInteractor>(() =>
        _i10.HomeInteractor(repository: gh<_i4.HomeRepositoryInterface>()));
    gh.singleton<_i11.PiramidaInteractor>(() => _i11.PiramidaInteractor(
        repository: gh<_i6.PiramidaRepositoryInterface>()));
    gh.factory<_i12.PiramidaBloc>(() =>
        _i12.PiramidaBloc(piramidaInteractor: gh<_i11.PiramidaInteractor>()));
    gh.factory<_i13.HomeBloc>(
        () => _i13.HomeBloc(homeInteractor: gh<_i10.HomeInteractor>()));
    gh.singleton<_i14.ProfileInteractor>(
        () => _i14.ProfileInteractor(gh<_i9.ProfileRepository>()));
    gh.factory<_i15.ProfileBloc>(
        () => _i15.ProfileBloc(gh<_i14.ProfileInteractor>()));
    gh.singleton<_i16.OtherInteractor>(
        () => _i16.OtherInteractor(gh<_i8.OtherRepository>()));
    gh.factory<_i17.OtherBloc>(
        () => _i17.OtherBloc(gh<_i16.OtherInteractor>()));
    return this;
  }
}
