import 'package:dartz/dartz.dart';

abstract class {{feature_name.pascalCase()}}RepositoryImpl {
    Future<Either<Exception, String>> get{{feature_name.pascalCase()}}();
}


 