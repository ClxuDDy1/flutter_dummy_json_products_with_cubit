import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(
      'REQUEST: ${options.method} - ${options.path} - ${options.queryParameters}',
    );

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint("STATUS CODE:${response.statusCode}");
    debugPrint("RESPONSE: ${response.data}");
    debugPrint('PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint("ERROR: ${err.message}");
    debugPrint("${err.response?.statusCode}");
    debugPrint("PATH: ${err.requestOptions.path}");
    debugPrint("DATA: ${err.response?.data}");
    debugPrint("ERROR TYPE: ${err.type}");
    debugPrint("UNDERLYING: ${err.error}");
    super.onError(err, handler);
  }
}
