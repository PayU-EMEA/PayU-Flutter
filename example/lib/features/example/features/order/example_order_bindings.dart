import 'package:get/get.dart';

import 'package:example/features/example/features/order/example_order_controller.dart';

class ExampleOrderBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ExampleOrderController(Get.find(), Get.find()));
  }
}
