
import 'package:dartz/dartz.dart';
import 'package:test_app/feature/{{feature_name}}/domain/repositories/{{feature_name}}_repository_impl.dart';
import 'package:test_app/shared/config/api_service/api_client.dart';

 
 class {{repository_name.pascalCase()}}Repository  implements  {{feature_name.pascalCase()}}RepositoryImpl{
   final ApiClient _apiClient;

  const {{repository_name.pascalCase()}}Repository(this._apiClient);
  

  @override
  Future<Either<Exception, String>> get{{feature_name.pascalCase()}}() {
    final response = _apiClient.dio.get('/todos/1');

    return response.then((value) => Right(value.data.toString()));
  }
}




