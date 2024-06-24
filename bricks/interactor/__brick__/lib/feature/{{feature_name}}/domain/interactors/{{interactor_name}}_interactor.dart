import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/{{feature_name}}/data/model/{{interactor_name}}/{{interactor_name}}_model.dart';
import 'package:test_app/feature/{{feature_name}}/domain/repositories/{{interactor_name}}/{{interactor_name}}_repository_interface.dart';

@singleton
class {{interactor_name.pascalCase()}}Interactor {
  {{interactor_name.pascalCase()}}Interactor({
    required {{interactor_name.pascalCase()}}RepositoryInterface repository,
  }) : _repository = repository;

  final {{interactor_name.pascalCase()}}RepositoryInterface _repository;

  Future<Either<Exception, {{interactor_name.pascalCase()}}Model>> get{{interactor_name.pascalCase()}}() async {
    return await _repository.get{{interactor_name.pascalCase()}}();
  }
}
