import 'dart:io';

import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String message;
  final int errorCode;

  ServerException(this.message, this.errorCode);

  factory ServerException.fromDio(DioException e) {
    String message = 'Unexpected error';
    int errorCode = 0;

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      message = 'Connection timeout, please try again.';
    } else if (e.type == DioExceptionType.badResponse) {
      errorCode = e.response?.statusCode ?? 0;
      message = 'Received invalid status code: $errorCode';
    } else if (e.error is SocketException) {
      message = 'No Internet connection, please check your network.';
    } else {
      message = e.message ?? 'Unexpected error';
    }

    return ServerException(message, errorCode);
  }

  @override
  String toString() => 'ServerException: $message (Error Code: $errorCode)';
}
