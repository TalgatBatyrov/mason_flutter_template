import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/home/data/repositories/home_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;
  HomeBloc(this._homeRepository) : super(const HomeState.initial()) {
    on<_FetchData>(onFetchData);
  }
  FutureOr<void> onFetchData(
    _FetchData event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    final response = await _homeRepository.getHome();
    response.fold(
      (l) => emit(HomeState.error(l.toString())),
      (r) => emit(HomeState.success(r)),
    );
  }
}
