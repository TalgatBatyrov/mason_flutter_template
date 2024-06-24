// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/{{feature_name}}/data/model/{{bloc_name}}/{{bloc_name}}_model.dart';
import 'package:test_app/feature/{{feature_name}}/domain/interactors/{{bloc_name}}_interactor.dart';

part '{{bloc_name}}_bloc.freezed.dart';

@injectable
class {{bloc_name.pascalCase()}}Bloc extends Bloc<{{bloc_name.pascalCase()}}Event, {{bloc_name.pascalCase()}}State> {
    {{bloc_name.pascalCase()}}Bloc({required {{bloc_name.pascalCase()}}Interactor {{bloc_name}}Interactor})
      : _{{bloc_name}}Interactor = {{bloc_name}}Interactor,
        super(const {{bloc_name.pascalCase()}}State.initial()) {
    on<{{bloc_name.pascalCase()}}Event>(_onEvent);
  }

  final {{bloc_name.pascalCase()}}Interactor _{{bloc_name}}Interactor;

  _onEvent(
    {{bloc_name.pascalCase()}}Event events,
    Emitter<{{bloc_name.pascalCase()}}State> emit,
  ) {
    return events.map(
      fetchData: (v) => onFetchData(v, emit),
    );
  }

  onFetchData(
    _FetchDataEvent event,
    Emitter<{{bloc_name.pascalCase()}}State> emit,
  ) async {
    emit(const {{bloc_name.pascalCase()}}State.loading());
    final response = await _{{bloc_name}}Interactor.get{{bloc_name.pascalCase()}}();

    response.fold(
      (l) => emit({{bloc_name.pascalCase()}}State.error(message: l.toString())),
      (r) => emit({{bloc_name.pascalCase()}}State.success(data: r)),
    );
  }

  
}

@freezed
class {{bloc_name.pascalCase()}}Event with _${{bloc_name.pascalCase()}}Event {
  const factory {{bloc_name.pascalCase()}}Event.fetchData() = _FetchDataEvent;
}

@freezed
class {{bloc_name.pascalCase()}}State with _${{bloc_name.pascalCase()}}State {
  const factory {{bloc_name.pascalCase()}}State.initial() = _Initial;
  const factory {{bloc_name.pascalCase()}}State.loading() = _Loading;
  const factory {{bloc_name.pascalCase()}}State.success({required {{bloc_name.pascalCase()}}Model data}) = _Data;
  const factory {{bloc_name.pascalCase()}}State.error({required String message}) = _Error;
}