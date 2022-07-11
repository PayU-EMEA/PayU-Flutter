import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:example/features/example/backend/data/repositories/settings_repository.dart';

class TokenInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final repository = Get.find<SettingsRepository>();
    options.headers['Authorization'] = 'Bearer ${repository.accessToken}';
    handler.next(options);
  }
}
