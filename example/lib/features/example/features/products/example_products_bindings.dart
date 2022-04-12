import 'package:get/get.dart';

import 'package:example/features/example/core/example_core_controller.dart';
import 'package:example/features/example/features/products/example_products_controller.dart';

class ExampleProductsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ExampleCoreController());
    Get.put(ExampleProductsController(Get.find()));
  }
}
