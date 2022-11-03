import 'package:example/features/settings/controllers/settings_currencies_controller.dart';
import 'package:example/features/settings/controllers/settings_environments_controller.dart';
import 'package:example/features/settings/settings_controller.dart';
import 'package:get/get.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingsCurrenciesController(Get.find()));
    Get.put(SettingsEnvironmentsController(Get.find()));
    Get.put(SettingsController(Get.find(), Get.find()));
  }
}
