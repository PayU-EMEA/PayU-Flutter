import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:example/features/example/backend/data/repositories/backend_constants.dart';
import 'package:example/features/example/backend/data/repositories/settings_repository.dart';

class BaseUrlInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final environment = Get.find<SettingsRepository>().environment;
    options.baseUrl = BackendConstants.apiBaseUrl(environment!);
    handler.next(options);
  }
}
