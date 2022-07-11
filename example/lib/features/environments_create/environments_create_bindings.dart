import 'package:get/get.dart';

import 'package:example/features/environments_create/environments_create_controller.dart';

class EnvironmentsCreateBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(EnvironmentsCreateController(Get.find()));
  }
}
