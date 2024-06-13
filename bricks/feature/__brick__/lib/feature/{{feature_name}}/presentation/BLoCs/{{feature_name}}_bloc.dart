import 'package:flutter_bloc/flutter_bloc.dart';

part '{{feature_name}}_event.dart';
part '{{feature_name}}_state.dart';

class {{feature_name.pascalCase()}}Bloc extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Bloc() : super(const {{feature_name.pascalCase()}}State()) {
    on<{{feature_name.pascalCase()}}Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
