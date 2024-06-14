import 'package:injectable/injectable.dart';
import 'package:test_app/feature/{{feature_name}}/data/repositories/{{feature_name}}_repository.dart';


@injectable
class {{interactor_name.pascalCase()}}Interactor {
  final {{feature_name.pascalCase()}}Repository _repository;
  {{interactor_name.pascalCase()}}Interactor(this._repository);

  Future<String> get{{interactor_name.pascalCase()}}() async {
    final response = await _repository.get{{feature_name.pascalCase()}}();
    return response.fold(
      (l) => throw Exception(l.toString()),
      (r) => r,
    );
  }
}
