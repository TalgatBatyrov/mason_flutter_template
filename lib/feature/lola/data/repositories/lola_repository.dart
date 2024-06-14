import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/lola/domain/repositories/lola_repository_impl.dart';
import 'package:test_app/shared/config/api_service/api_client.dart';


@injectable
 class LolaRepository  implements  LolaRepositoryImpl{
   final ApiClient _apiClient;

  const LolaRepository(this._apiClient);


  @override
  Future<Either<Exception, String>> getLola() async{
    final response = await _apiClient.dio.get('/todos/1');

    return Right(response.data.toString());
  }
}
