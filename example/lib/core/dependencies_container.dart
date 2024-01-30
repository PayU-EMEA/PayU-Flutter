import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:example/data/local/environments_db.dart';
import 'package:example/data/local/secure_db.dart';
import 'package:example/data/models/environment.dart';
import 'package:example/data/models/environment_model.dart';
import 'package:example/data/models/grant_type.dart';
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
import 'package:hive_flutter/hive_flutter.dart';
import 'package:payu/payu.dart';

class DependenciesContainer {
  static Future init() async {
    await _initCore();
    await _initBackendDependencies();
    await _initProjectDependencies();
    await _initProjectServices();
    await _initPayu();
  }

  static Future _initCore() async {
    await Hive.initFlutter();

    Hive.registerAdapter(EnvironmentAdapter());
    Hive.registerAdapter(EnvironmentModelAdapter());
    Hive.registerAdapter(GrantTypeAdapter());
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

    final box = await _initBox(SettingsDb.tag);
    Get.put(SettingsDb(box), permanent: true);

    Get.put(SettingsRepository(Get.find()), permanent: true);
    Get.put(BackendRepository(Get.find(), Get.find()), permanent: true);
  }

  static Future _initProjectDependencies() async {
    final environmentsDbBox = await _initBox(EnvironmentsDb.tag);
    Get.put(EnvironmentsDb(environmentsDbBox), permanent: true);

    final settingsDbBox = await _initBox(SecureDb.tag);
    Get.put(SecureDb(settingsDbBox), permanent: true);

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
  }

  static Future<Box> _initBox(String name) async {
    try {
      return Hive.openBox(name);
    } catch (e) {
      await Hive.deleteBoxFromDisk(name);
      return Hive.openBox(name);
    }
  }
}
