import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/{{feature_name}}/data/model/{{feature_name}}_model.dart';
import 'package:test_app/feature/{{feature_name}}/domain/repositories/{{feature_name}}_repository_interface.dart';

@singleton
class {{feature_name.pascalCase()}}Interactor {
  {{feature_name.pascalCase()}}Interactor({
    required {{feature_name.pascalCase()}}RepositoryInterface repository,
  }) : _repository = repository;

  final {{feature_name.pascalCase()}}RepositoryInterface _repository;

  Future<Either<Exception, {{feature_name.pascalCase()}}Model>> get{{feature_name.pascalCase()}}() async {
    return await _repository.get{{feature_name.pascalCase()}}();
  }
}

