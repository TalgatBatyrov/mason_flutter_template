import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/shared/config/flavors/flavor_config.dart';

@injectable
class ApiClient {
  late final Dio dio;

  ApiClient() {
    dio = Dio(baseOptions)
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (
            RequestOptions options,
            RequestInterceptorHandler handler,
          ) async {
            log('REQUEST[${options.method}] => PATH: ${options.path}');
            return handler.next(options);
          },
          onError: (DioException err, ErrorInterceptorHandler handler) async {
            return handler.next(err);
          },
          onResponse: (
            Response<dynamic> response,
            ResponseInterceptorHandler handler,
          ) {
            handler.next(response);
          },
        ),
      );
  }

  BaseOptions get baseOptions => BaseOptions(
        baseUrl: FlavorConfig.instance.apiBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      );
}
