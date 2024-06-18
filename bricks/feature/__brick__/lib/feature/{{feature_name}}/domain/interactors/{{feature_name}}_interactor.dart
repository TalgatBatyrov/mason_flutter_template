import 'package:injectable/injectable.dart';
import 'package:test_app/feature/{{feature_name}}/data/repositories/{{feature_name}}_repository.dart';


@singleton
class {{feature_name.pascalCase()}}Interactor {
  final {{feature_name.pascalCase()}}Repository _repository;
  {{feature_name.pascalCase()}}Interactor(this._repository);

  Future<String> get{{feature_name.pascalCase()}}() async {
    final response = await _repository.get{{feature_name.pascalCase()}}();
    return response.fold(
      (l) => throw Exception(l.toString()),
      (r) => r,
    );
  }
}
