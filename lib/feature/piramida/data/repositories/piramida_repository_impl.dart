import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/piramida/data/model/piramida_model.dart';
import 'package:test_app/feature/piramida/domain/repositories/piramida_repository_interface.dart';
import 'package:test_app/shared/config/api_service/api_client.dart';
import 'package:test_app/shared/config/api_service/exceptions/server_exception.dart';
import 'package:test_app/shared/config/di/injection.dart';

@Singleton(as: PiramidaRepositoryInterface)
class PiramidaRepositoryImpl implements PiramidaRepositoryInterface {
  const PiramidaRepositoryImpl();

  final String _getTodo = '/todos/1';

  @override
  Future<Either<Exception, PiramidaModel>> getPiramida() async {
    try {
      final apiClient = getIt<ApiClient>();

      final response = await apiClient.dio.get(_getTodo);

      final data = response.data as Map<String, dynamic>;

      final result = PiramidaModel.fromJson(data);

      return Right(result);
    } on DioException catch (e) {
      return Left(ServerException.fromDio(e));
    }
  }
}
