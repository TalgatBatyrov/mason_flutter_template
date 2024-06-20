// ignore_for_file: library_private_types_in_public_api
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/{{feature_name}}/data/model/{{feature_name}}_model.dart';
import 'package:test_app/feature/{{feature_name}}/domain/interactors/{{feature_name}}_interactor.dart';

part '{{feature_name}}_bloc.freezed.dart';

@injectable

class {{feature_name.pascalCase()}}Bloc extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Bloc({required {{feature_name.pascalCase()}}Interactor {{feature_name.camelCase()}}Interactor})
      : _{{feature_name.camelCase()}}Interactor = {{feature_name.camelCase()}}Interactor,
        super(const {{feature_name.pascalCase()}}State.initial()) {
    on<{{feature_name.pascalCase()}}Event>(_onEvent);
  }

  final {{feature_name.pascalCase()}}Interactor _{{feature_name.camelCase()}}Interactor;

  _onEvent(
    {{feature_name.pascalCase()}}Event events,
    Emitter<{{feature_name.pascalCase()}}State> emit,
  ) {
    return events.map(
      fetchData: (v) => onFetchData(v, emit),
    );
  }

  onFetchData(
    _FetchDataEvent event,
    Emitter<{{feature_name.pascalCase()}}State> emit,
  ) async {
    emit(const {{feature_name.pascalCase()}}State.loading());
    final response = await _{{feature_name.camelCase()}}Interactor.get{{feature_name.pascalCase()}}();

    response.fold(
      (l) => emit({{feature_name.pascalCase()}}State.error(message: l.toString())),
      (r) => emit({{feature_name.pascalCase()}}State.success(data: r)),
    );
  }
}

@freezed
class {{feature_name.pascalCase()}}Event with _${{feature_name.pascalCase()}}Event {
  const factory {{feature_name.pascalCase()}}Event.fetchData() = _FetchDataEvent;
}

@freezed
class {{feature_name.pascalCase()}}State with _${{feature_name.pascalCase()}}State {
  const factory {{feature_name.pascalCase()}}State.initial() = _Initial;
  const factory {{feature_name.pascalCase()}}State.loading() = _Loading;
  const factory {{feature_name.pascalCase()}}State.success({required {{feature_name.pascalCase()}}Model data}) = _Data;
  const factory {{feature_name.pascalCase()}}State.error({required String message}) = _Error;
}