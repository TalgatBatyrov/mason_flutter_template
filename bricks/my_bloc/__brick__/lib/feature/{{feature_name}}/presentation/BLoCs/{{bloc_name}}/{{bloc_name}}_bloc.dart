import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/{{feature_name}}/data/repositories/{{feature_name}}_repository.dart';

part '{{bloc_name}}_bloc.freezed.dart';
part '{{bloc_name}}_event.dart';
part '{{bloc_name}}_state.dart';

@injectable
class {{bloc_name.pascalCase()}}Bloc extends Bloc<{{bloc_name.pascalCase()}}Event, {{bloc_name.pascalCase()}}State> {
   final {{feature_name.pascalCase()}}Repository _{{feature_name}}Repository;
  {{bloc_name.pascalCase()}}Bloc(this._{{feature_name}}Repository) : super(const {{bloc_name.pascalCase()}}State.initial()) {
    on<{{bloc_name.pascalCase()}}Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
