import 'package:dio/dio.dart';
import 'package:flutter_dummy_json_products_with_cubit/core/constants/api_constants.dart';
import 'package:flutter_dummy_json_products_with_cubit/core/network/dio_interceptor.dart';

class DioFactory {
  DioFactory._();
  static Dio create() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        responseType: ResponseType.json,
      ),
    );
    dio.interceptors.add(DioInterceptor());
    return dio;
  }
}
