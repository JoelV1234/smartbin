import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/api/model/api_info.dart';
import 'package:smartbin/api/model/response.dart';
import 'package:smartbin/auth/auth_provider.dart';
import 'package:smartbin/auth/models/auth_credentials.dart';


final serverApiProvider = Provider<ServerApi>((ref) {
  return ServerApi(ref);
});

class ServerApi {
  final Ref ref;
  final Dio dio =  Dio(
    BaseOptions(
      baseUrl: ApiInfo.baseUrl,
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 3000),
    ),
  );
  AuthCredentials? get credentials => ref.read(authProvider);
  ServerApi(this.ref);
  String get token => credentials!.accessToken;

  Map<String, dynamic> get headers => {
    'Authorization' : 'Bearer $token',
    'Content-Type' : 'application/json',
  };

  Future<ApiResponse> httpGet({
    required String endpoint,
    Map<String, dynamic>? body,
  }) async => ApiResponse.fromDio( await dio.get(
        endpoint,
        data: body ?? {},
        options: Options(headers: headers),
      ));

  Future<ApiResponse> httpPost({
    required String endpoint,
    Map<String, dynamic>? body,
  }) async {
    return ApiResponse.fromDio( await dio.post(
      endpoint,
      data: body ?? {},
      options: Options(headers: headers),
    ));
  }
}