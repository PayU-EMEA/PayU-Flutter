import 'package:get/get.dart';

import 'package:example/features/demo_add_card_widget/demo_add_card_widget_controller.dart';

class DemoAddCardWidgetBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(DemoAddCardWidgetController());
  }
}
