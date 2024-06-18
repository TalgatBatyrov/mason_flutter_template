import 'dart:io';

import 'package:dio/dio.dart';

class ServerException implements Exception {
  ServerException(this.message, this.errorCode);

  final String? message;
  final int errorCode;

  factory ServerException.fromDio(DioException e) {
    String? message = '';
    int? errorCode = 0;

    if ([
          DioExceptionType.receiveTimeout,
          DioExceptionType.connectionTimeout,
          DioExceptionType.sendTimeout,
        ].contains(e.type) ||
        e.error is SocketException ||
        e.response?.statusCode == 504) {
      message = 'Server error connection';
    } else {
      final response = e.response;

      if (response == null) {
        message = e.message;
      } else {
        errorCode = response.statusCode;
        if (response.data is String) {
          final responseString = response.data as String;
          message = responseString.isEmpty ? e.message : responseString;
        } else {
          if (response.data is List<dynamic>) {
            message = (response.data as List<dynamic>).first as String;
          } else {
            final responseData = response.data as Map<String, dynamic>;

            if (responseData.containsKey('detail')) {
              message = responseData['detail'] as String;
            } else if (responseData.containsKey('message')) {
              message = responseData['message'] as String;
            } else {
              message = 'Unexpected error';
            }
          }
        }
      }
    }

    return ServerException(message, errorCode ?? 0);
  }
}
