import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/{{feature_name}}/data/repositories/{{feature_name}}_repository.dart';

part '{{feature_name}}_bloc.freezed.dart';
part '{{feature_name}}_event.dart';
part '{{feature_name}}_state.dart';

@injectable
class {{feature_name.pascalCase()}}Bloc extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
   final {{feature_name.pascalCase()}}Repository _{{feature_name}}Repository;
  {{feature_name.pascalCase()}}Bloc(this._{{feature_name}}Repository) : super(const {{feature_name.pascalCase()}}State.initial()) {
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
      final response = await _{{feature_name}}Repository.get{{feature_name.pascalCase()}}();
      response.fold(
        (l) => emit({{feature_name.pascalCase()}}State.error(message: l.toString())),
        (r) => emit({{feature_name.pascalCase()}}State.success(data: r)),
      );
    }
}
