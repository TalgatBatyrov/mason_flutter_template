import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/profile/domain/repositories/profile_repository_impl.dart';
import 'package:test_app/shared/config/api_service/api_client.dart';


@injectable
 class ProfileRepository  implements  ProfileRepositoryImpl{
   final ApiClient _apiClient;

  const ProfileRepository(this._apiClient);


  @override
  Future<Either<Exception, String>> getProfile() async{
    final response = await _apiClient.dio.get('/todos/1');

    return Right(response.data.toString());
  }
}
