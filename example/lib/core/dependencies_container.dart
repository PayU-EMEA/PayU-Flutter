import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:example/data/local/environments_db.dart';
import 'package:example/data/local/secure_db.dart';
import 'package:example/data/models/environment.dart';
import 'package:example/data/repositories/data_repository.dart';
import 'package:example/data/repositories/environments_repository.dart';
import 'package:example/data/repositories/secure_storage.dart';
import 'package:example/data/services/environments_service.dart';
import 'package:example/features/example/backend/api/api.dart';
import 'package:example/features/example/backend/api/interceptors/base_url_interceptor.dart';
import 'package:example/features/example/backend/api/interceptors/error_interceptor.dart';
import 'package:example/features/example/backend/api/interceptors/token_interceptor.dart';
import 'package:example/features/example/backend/data/local/setting_db.dart';
import 'package:example/features/example/backend/data/repositories/backend_repository.dart';
import 'package:example/features/example/backend/data/repositories/settings_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:payu/payu.dart';

class DependenciesContainer {
  static Future init() async {
    await _initCore();
    await _initBackendDependencies();
    await _initProjectDependencies();
    await _initProjectServices();
    await _initPayu();
  }

  static late SharedPreferences _prefs;

  static Future _initCore() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future _initBackendDependencies() async {
    final dio = Dio();
    dio.options.followRedirects = true;
    dio.options.validateStatus = (status) => status! < 400;

    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;

        return client;
      },
    );

    dio.interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: (object) => log(object.toString()),
      ),
      BaseUrlInterceptor(),
      ErrorInterceptor(),
      TokenInterceptor(),
    ]);

    Get.put(dio, permanent: true);
    Get.put(Api(Get.find()), permanent: true);

    Get.put(SettingsDb(_prefs), permanent: true);

    Get.put(SettingsRepository(Get.find()), permanent: true);
    Get.put(BackendRepository(Get.find(), Get.find()), permanent: true);
  }

  static Future _initProjectDependencies() async {
    Get.put(EnvironmentsDb(_prefs), permanent: true);
    Get.put(SecureDb(_prefs), permanent: true);

    Get.put(DataRepository(Get.find()), permanent: true);
    Get.put(EnvironmentsRepository(Get.find(), Get.find()), permanent: true);
    Get.put(SecureStorage(Get.find()), permanent: true);
  }

  static Future _initProjectServices() async {
    final service = EnvironmentsService(Get.find(), Get.find());
    await service.init();
    Get.put(service);
  }

  static Future _initPayu() async {
    final repository = Get.find<SettingsRepository>();

    final clientId = repository.clientId;
    final environment = repository.environment;

    if (clientId == null) return;
    if (environment == null) return;

    Payu.pos = POS(id: clientId);
    Payu.environment = environment.toPayu();
    Payu.locale = Locale(repository.languageCode);
    Payu.cardInstallments = repository.cardInstallments;
  }
}
