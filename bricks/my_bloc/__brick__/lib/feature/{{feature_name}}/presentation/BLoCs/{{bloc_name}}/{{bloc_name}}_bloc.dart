import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/{{feature_name}}/domain/interactors/{{feature_name}}_interactor.dart';

part '{{bloc_name}}_bloc.freezed.dart';
part '{{bloc_name}}_event.dart';
part '{{bloc_name}}_state.dart';

@injectable
class {{bloc_name.pascalCase()}}Bloc extends Bloc<{{bloc_name.pascalCase()}}Event, {{bloc_name.pascalCase()}}State> {
   final {{feature_name.pascalCase()}}Interactor _{{feature_name}}Interactor;
  {{bloc_name.pascalCase()}}Bloc(this._{{feature_name}}Interactor) : super(const {{bloc_name.pascalCase()}}State.initial()) {
    on<{{bloc_name.pascalCase()}}Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
