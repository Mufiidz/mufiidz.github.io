import 'package:dio/dio.dart';

import '../../utils/utils_export.dart';

class DioClient {
  DioClient._();

  static Dio get init => Dio(BaseOptions(
        baseUrl: Const.baseUrl,
        connectTimeout: Const.connectionTimeout,
        receiveTimeout: Const.receiveTimeout,
        responseType: ResponseType.json,
      ))
        ..interceptors.add(LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ));
}
