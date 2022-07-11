import 'package:get/get.dart';

import 'package:example/features/demo_theme/demo_theme_controller.dart';

class DemoThemeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(DemoThemeController());
  }
}
