import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/other/domain/repositories/other_repository_impl.dart';
import 'package:test_app/shared/config/api_service/api_client.dart';


@injectable
 class OtherRepository  implements  OtherRepositoryImpl{
   final ApiClient _apiClient;

  const OtherRepository(this._apiClient);


  @override
  Future<Either<Exception, String>> getOther() async{
    final response = await _apiClient.dio.get('/todos/1');

    return Right(response.data.toString());
  }
}
