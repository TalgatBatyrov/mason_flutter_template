import 'package:dartz/dartz.dart';
import 'package:test_app/feature/{{feature_name}}/data/model/{{repository_name}}/{{repository_name}}_model.dart';

abstract class {{repository_name.pascalCase()}}RepositoryInterface {
  Future<Either<Exception, {{repository_name.pascalCase()}}Model>> get{{repository_name.pascalCase()}}();
}