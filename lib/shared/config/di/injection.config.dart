// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:test_app/feature/home/data/repositories/home_repository.dart'
    as _i4;
import 'package:test_app/feature/home/domain/interactors/home_interactor.dart'
    as _i7;
import 'package:test_app/feature/home/presentation/BLoCs/home_bloc.dart' as _i9;
import 'package:test_app/feature/other/data/repositories/other_repository.dart'
    as _i5;
import 'package:test_app/feature/other/domain/interactors/other_interactor.dart'
    as _i11;
import 'package:test_app/feature/other/presentation/BLoCs/other_bloc.dart'
    as _i12;
import 'package:test_app/feature/profile/data/repositories/profile_repository.dart'
    as _i6;
import 'package:test_app/feature/profile/domain/interactors/profile_interactor.dart'
    as _i8;
import 'package:test_app/feature/profile/presentation/BLoCs/profile_bloc.dart'
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
    gh.factory<_i4.HomeRepository>(
        () => _i4.HomeRepository(gh<_i3.ApiClient>()));
    gh.factory<_i5.OtherRepository>(
        () => _i5.OtherRepository(gh<_i3.ApiClient>()));
    gh.factory<_i6.ProfileRepository>(
        () => _i6.ProfileRepository(gh<_i3.ApiClient>()));
    gh.singleton<_i7.HomeInteractor>(
        () => _i7.HomeInteractor(gh<_i4.HomeRepository>()));
    gh.singleton<_i8.ProfileInteractor>(
        () => _i8.ProfileInteractor(gh<_i6.ProfileRepository>()));
    gh.factory<_i9.HomeBloc>(() => _i9.HomeBloc(gh<_i7.HomeInteractor>()));
    gh.factory<_i10.ProfileBloc>(
        () => _i10.ProfileBloc(gh<_i8.ProfileInteractor>()));
    gh.singleton<_i11.OtherInteractor>(
        () => _i11.OtherInteractor(gh<_i5.OtherRepository>()));
    gh.factory<_i12.OtherBloc>(
        () => _i12.OtherBloc(gh<_i11.OtherInteractor>()));
    return this;
  }
}
