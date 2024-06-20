import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/home/data/model/home_model.dart';
import 'package:test_app/feature/home/domain/repositories/home_repository_interface.dart';
import 'package:test_app/shared/config/api_service/api_client.dart';
import 'package:test_app/shared/config/api_service/exceptions/server_exception.dart';
import 'package:test_app/shared/config/di/injection.dart';

@Singleton(as: HomeRepositoryInterface)
class HomeRepositoryImpl implements HomeRepositoryInterface {
  const HomeRepositoryImpl();

  final String _getTodo = '/todos/1';

  @override
  Future<Either<Exception, HomeModel>> getHome() async {
    try {
      final apiClient = getIt<ApiClient>();

      final response = await apiClient.dio.get(_getTodo);

      final data = response.data as Map<String, dynamic>;

      final result = HomeModel.fromJson(data);

      return Right(result);
    } on DioException catch (e) {
      return Left(ServerException.fromDio(e));
    } catch (e) {
      return Left(Exception('Unexpected error: $e'));
    }
  }
}
