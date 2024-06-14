import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/{{feature_name}}/domain/repositories/{{feature_name}}_repository_impl.dart';
import 'package:test_app/shared/config/api_service/api_client.dart';


@injectable
 class {{feature_name.pascalCase()}}Repository  implements  {{feature_name.pascalCase()}}RepositoryImpl{
   final ApiClient _apiClient;

  const {{feature_name.pascalCase()}}Repository(this._apiClient);


  @override
  Future<Either<Exception, String>> get{{feature_name.pascalCase()}}() async{
    final response = await _apiClient.dio.get('/todos/1');

    return Right(response.data.toString());
  }
}
