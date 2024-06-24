import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/home/data/model/joke/joke_model.dart';
import 'package:test_app/feature/home/domain/repositories/joke/joke_repository_interface.dart';
import 'package:test_app/shared/config/api_service/api_client.dart';
import 'package:test_app/shared/config/api_service/exceptions/server_exception.dart';
import 'package:test_app/shared/config/di/injection.dart';

@Singleton(as: JokeRepositoryInterface)
class JokeRepositoryImpl implements JokeRepositoryInterface {
  const JokeRepositoryImpl();

  final String _getTodo = '/todos/1';

  @override
  Future<Either<Exception, JokeModel>> getJoke() async {
    try {
      final apiClient = getIt<ApiClient>();

      final response = await apiClient.dio.get(_getTodo);

      final data = response.data as Map<String, dynamic>;

      final result = JokeModel.fromJson(data);

      return Right(result);
    } on DioException catch (e) {
      return Left(ServerException.fromDio(e));
    } catch (e) {
      return Left(Exception('Unexpected error: $e'));
    }
  }
}