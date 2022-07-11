import 'package:get/get.dart';

import 'package:example/features/demo_web_payments_secure/demo_web_payments_secure_controller.dart';

class DemoWebPaymentsSecureBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(DemoWebPaymentsSecureController());
  }
}
