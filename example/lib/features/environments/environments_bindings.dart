import 'package:get/get.dart';

import 'package:example/features/environments/environments_controller.dart';

class EnvironmentsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(EnvironmentsController(Get.find(), Get.find()));
  }
}
