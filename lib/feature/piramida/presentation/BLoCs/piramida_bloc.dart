// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/piramida/data/model/piramida_model.dart';
import 'package:test_app/feature/piramida/domain/interactors/piramida_interactor.dart';

part 'piramida_bloc.freezed.dart';

@injectable
class PiramidaBloc extends Bloc<PiramidaEvent, PiramidaState> {
  PiramidaBloc({required PiramidaInteractor piramidaInteractor})
      : _piramidaInteractor = piramidaInteractor,
        super(const PiramidaState.initial()) {
    on<PiramidaEvent>(_onEvent);
  }

  final PiramidaInteractor _piramidaInteractor;

  _onEvent(
    PiramidaEvent events,
    Emitter<PiramidaState> emit,
  ) {
    return events.map(
      fetchData: (v) => onFetchData(v, emit),
    );
  }

  onFetchData(
    _FetchDataEvent event,
    Emitter<PiramidaState> emit,
  ) async {
    emit(const PiramidaState.loading());
    final response = await _piramidaInteractor.getPiramida();

    response.fold(
      (l) => emit(PiramidaState.error(message: l.toString())),
      (r) => emit(PiramidaState.success(data: r)),
    );
  }
}

@freezed
class PiramidaEvent with _$PiramidaEvent {
  const factory PiramidaEvent.fetchData() = _FetchDataEvent;
}

@freezed
class PiramidaState with _$PiramidaState {
  const factory PiramidaState.initial() = _Initial;
  const factory PiramidaState.loading() = _Loading;
  const factory PiramidaState.success({required PiramidaModel data}) = _Data;
  const factory PiramidaState.error({required String message}) = _Error;
}
