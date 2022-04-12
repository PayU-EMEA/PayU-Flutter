import 'package:dio/dio.dart';

import 'package:example/data/models/request_response.dart';

class _ErrorInterceptorDioError extends DioError {
  _ErrorInterceptorDioError({
    required RequestOptions requestOptions,
    required dynamic error,
  }) : super(requestOptions: requestOptions, error: error);

  @override
  String toString() => error.toString();
}

class ErrorInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      if (err.response?.data is Map<String, dynamic>) {
        final json = err.response?.data as Map<String, dynamic>;
        final response = RequestResponse.fromJson(json);
        handler.next(
          _ErrorInterceptorDioError(
            requestOptions: err.requestOptions,
            error: response,
          ),
        );
        return;
      }
    }

    super.onError(err, handler);
  }
}
