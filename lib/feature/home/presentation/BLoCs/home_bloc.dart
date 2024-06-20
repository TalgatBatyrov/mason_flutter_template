// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/home/data/model/home_model.dart';
import 'package:test_app/feature/home/domain/interactors/home_interactor.dart';

part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required HomeInteractor homeInteractor})
      : _homeInteractor = homeInteractor,
        super(const HomeState.initial()) {
    on<HomeEvent>(_onEvent);
  }

  final HomeInteractor _homeInteractor;

  _onEvent(
    HomeEvent events,
    Emitter<HomeState> emit,
  ) {
    return events.map(
      fetchData: (v) => onFetchData(v, emit),
    );
  }

  onFetchData(
    _FetchDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    final response = await _homeInteractor.getHome();

    response.fold(
      (l) => emit(HomeState.error(message: l.toString())),
      (r) => emit(HomeState.success(data: r)),
    );
  }
}

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchData() = _FetchDataEvent;
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success({required HomeModel data}) = _Data;
  const factory HomeState.error({required String message}) = _Error;
}
