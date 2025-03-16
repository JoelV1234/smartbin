import 'package:dio/dio.dart';

class ApiResponse<T> {
  final int? statusCode;
  final String? statusMessage;
  final T data;

  ApiResponse(
    this.statusCode, 
    this.statusMessage,
    this.data
  );

  factory ApiResponse.fromDio(Response response) {
    return ApiResponse(
      response.statusCode,
      response.statusMessage,
      response.data
    );
  }
}