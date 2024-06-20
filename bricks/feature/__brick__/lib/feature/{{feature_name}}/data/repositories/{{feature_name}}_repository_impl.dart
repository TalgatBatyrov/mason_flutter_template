import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/feature/{{feature_name}}/data/model/{{feature_name}}_model.dart';
import 'package:test_app/feature/{{feature_name}}/domain/repositories/{{feature_name}}_repository_interface.dart';
import 'package:test_app/shared/config/api_service/api_client.dart';
import 'package:test_app/shared/config/api_service/exceptions/server_exception.dart';
import 'package:test_app/shared/config/di/injection.dart';



@Singleton(as: {{feature_name.pascalCase()}}RepositoryInterface)
class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}RepositoryInterface {
  const {{feature_name.pascalCase()}}RepositoryImpl();

  final String _getTodo = '/todos/1';

  @override
  Future<Either<Exception, {{feature_name.pascalCase()}}Model>> get{{feature_name.pascalCase()}}() async {
    try {
      final apiClient = getIt<ApiClient>();

      final response = await apiClient.dio.get(_getTodo);

      final data = response.data as Map<String, dynamic>;

      final result = {{feature_name.pascalCase()}}Model.fromJson(data);

      return Right(result);
    } on DioException catch (e) {
      return Left(ServerException.fromDio(e));
    } catch (e) {
      return Left(Exception('Unexpected error: $e'));
    }
  }
}

