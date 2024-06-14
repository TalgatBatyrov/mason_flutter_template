import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/{{feature_name}}/domain/interactors/{{feature_name}}_interactor.dart';


part '{{feature_name}}_bloc.freezed.dart';
part '{{feature_name}}_event.dart';
part '{{feature_name}}_state.dart';

@injectable
class {{feature_name.pascalCase()}}Bloc extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
   final {{feature_name.pascalCase()}}Interactor _{{feature_name}}Interactor;
  {{feature_name.pascalCase()}}Bloc(this._{{feature_name}}Interactor) : super(const {{feature_name.pascalCase()}}State.initial()) {
    on<{{feature_name.pascalCase()}}Event>(_onEvent);
  }
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
    try {
      final response = await _{{feature_name}}Interactor.get{{feature_name.pascalCase()}}();
      emit({{feature_name.pascalCase()}}State.success(data: response));
    } catch (e) {
      emit({{feature_name.pascalCase()}}State.error(message: e.toString()));
    }
  }
}
