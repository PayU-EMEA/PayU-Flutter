import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/features/example/features/test_cards/example_test_cards_controller.dart';

class ExampleTestCardsBindings implements Bindings {
  @override
  void dependencies() {
    final client = TestCardsService.create();
    Get.put(ExampleTestCardsController(client));
  }
}
