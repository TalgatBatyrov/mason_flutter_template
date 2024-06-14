part of '../home_bloc.dart';

extension FetchData on HomeBloc {
  _$onFetchData(
    _FetchDataEvent event,
  ) async {
    emit(const HomeState.loading());
    final response = await _homeRepository.getHome();
    response.fold(
      (l) => emit(HomeState.error(message: l.toString())),
      (r) => emit(HomeState.success(data: r)),
    );
  }
}
