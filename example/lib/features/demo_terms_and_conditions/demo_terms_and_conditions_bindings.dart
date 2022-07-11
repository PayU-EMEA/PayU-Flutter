import 'package:get/get.dart';

import 'package:example/features/demo_terms_and_conditions/demo_terms_and_conditions_controller.dart';

class DemoTermsAndConditionsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(DemoTermsAndConditionsController());
  }
}
