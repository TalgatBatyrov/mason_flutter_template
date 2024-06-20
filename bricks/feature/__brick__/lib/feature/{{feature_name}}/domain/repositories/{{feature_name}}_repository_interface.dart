import 'package:dartz/dartz.dart';
import 'package:test_app/feature/{{feature_name}}/data/model/{{feature_name}}_model.dart';

abstract class {{feature_name.pascalCase()}}RepositoryInterface {
    Future<Either<Exception, {{feature_name.pascalCase()}}Model>> get{{feature_name.pascalCase()}}();
}