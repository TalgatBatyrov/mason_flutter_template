import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/{{feature_name}}/data/model/{{repository_name}}/{{repository_name}}_model.dart';
import 'package:test_app/feature/{{feature_name}}/domain/repositories/{{repository_name}}/{{repository_name}}_repository_interface.dart';
import 'package:test_app/shared/config/api_service/api_client.dart';
import 'package:test_app/shared/config/api_service/exceptions/server_exception.dart';
import 'package:test_app/shared/config/di/injection.dart';

@Singleton(as: {{repository_name.pascalCase()}}RepositoryInterface)
class {{repository_name.pascalCase()}}RepositoryImpl implements {{repository_name.pascalCase()}}RepositoryInterface {
  const {{repository_name.pascalCase()}}RepositoryImpl();

  final String _getTodo = '/todos/1';

  @override
  Future<Either<Exception, {{repository_name.pascalCase()}}Model>> get{{repository_name.pascalCase()}}() async {
    try {
      final apiClient = getIt<ApiClient>();

      final response = await apiClient.dio.get(_getTodo);

      final data = response.data as Map<String, dynamic>;

      final result = {{repository_name.pascalCase()}}Model.fromJson(data);

      return Right(result);
    } on DioException catch (e) {
      return Left(ServerException.fromDio(e));
    } catch (e) {
      return Left(Exception('Unexpected error: $e'));
    }
  }
}