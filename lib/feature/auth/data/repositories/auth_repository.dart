import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/auth/domain/repositories/auth_repository_impl.dart';
import 'package:test_app/shared/config/api_service/api_client.dart';

@injectable
class AuthRepository implements AuthRepositoryImpl {
  final ApiClient _apiClient;

  const AuthRepository(this._apiClient);

  @override
  Future<Either<Exception, String>> getAuth() {
    final response = _apiClient.dio.get('/todos/1');

    return response.then((value) => Right(value.data.toString()));
  }
}
