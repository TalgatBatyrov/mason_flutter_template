// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/home/data/model/joke/joke_model.dart';
import 'package:test_app/feature/home/domain/interactors/joke_interactor.dart';

part 'joke_bloc.freezed.dart';

@injectable
class JokeBloc extends Bloc<JokeEvent, JokeState> {
    JokeBloc({required JokeInteractor jokeInteractor})
      : _jokeInteractor = jokeInteractor,
        super(const JokeState.initial()) {
    on<JokeEvent>(_onEvent);
  }

  final JokeInteractor _jokeInteractor;

  _onEvent(
    JokeEvent events,
    Emitter<JokeState> emit,
  ) {
    return events.map(
      fetchData: (v) => onFetchData(v, emit),
    );
  }

  onFetchData(
    _FetchDataEvent event,
    Emitter<JokeState> emit,
  ) async {
    emit(const JokeState.loading());
    final response = await _jokeInteractor.getJoke();

    response.fold(
      (l) => emit(JokeState.error(message: l.toString())),
      (r) => emit(JokeState.success(data: r)),
    );
  }

  
}

@freezed
class JokeEvent with _$JokeEvent {
  const factory JokeEvent.fetchData() = _FetchDataEvent;
}

@freezed
class JokeState with _$JokeState {
  const factory JokeState.initial() = _Initial;
  const factory JokeState.loading() = _Loading;
  const factory JokeState.success({required JokeModel data}) = _Data;
  const factory JokeState.error({required String message}) = _Error;
}