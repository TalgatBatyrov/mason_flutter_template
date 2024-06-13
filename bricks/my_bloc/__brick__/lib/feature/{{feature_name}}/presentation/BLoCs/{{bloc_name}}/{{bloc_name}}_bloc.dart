import 'package:bloc/bloc.dart';

part '{{bloc_name}}_event.dart';
part '{{bloc_name}}_state.dart';

class {{bloc_name.pascalCase()}}Bloc extends Bloc<{{bloc_name.pascalCase()}}Event, {{bloc_name.pascalCase()}}State> {
  {{bloc_name.pascalCase()}}Bloc() : super(const {{bloc_name.pascalCase()}}State()) {
    on<{{bloc_name.pascalCase()}}Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
