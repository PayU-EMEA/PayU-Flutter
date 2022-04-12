import 'package:get/get.dart';

import 'package:example/features/example/features/checkout/controllers/example_checkout_installments_controller.dart';
import 'package:example/features/example/features/checkout/controllers/example_checkout_redirect_controller.dart';
import 'package:example/features/example/features/checkout/example_checkout_controller.dart';

class ExampleCheckoutBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ExampleCheckoutInstallmentsController(Get.find()));
    Get.put(ExampleCheckoutRedirectController());
    Get.put(ExampleCheckoutController(Get.find(), Get.find(), Get.find()));
  }
}
