import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/home/domain/repositories/home_repository_impl.dart';
import 'package:test_app/shared/config/api_service/api_client.dart';


@injectable
 class HomeRepository  implements  HomeRepositoryImpl{
   final ApiClient _apiClient;

  const HomeRepository(this._apiClient);


  @override
  Future<Either<Exception, String>> getHome() {
    final response = _apiClient.dio.get('/todos/1');

    return response.then((value) => Right(value.data.toString()));
  }

  // Future<Either<Exception, HomeModel>> getHome() async {}
}
