import 'package:get/get.dart';

import 'package:example/features/example/core/example_core_controller.dart';
import 'package:example/features/example/features/method/example_method_controller.dart';
import 'package:example/features/example/features/method/processors/example_apple_pay_processor.dart';
import 'package:example/features/example/features/method/processors/example_blik_code_processor.dart';
import 'package:example/features/example/features/method/processors/example_blik_token_processor.dart';
import 'package:example/features/example/features/method/processors/example_card_token_processor.dart';
import 'package:example/features/example/features/method/processors/example_installments_processor.dart';
import 'package:example/features/example/features/method/processors/example_method_processor.dart';
import 'package:example/features/example/features/method/processors/example_pay_by_link_processor.dart';
import 'package:payu/payu.dart';

class ExampleMethodBindings implements Bindings {
  @override
  void dependencies() {
    final products = Get.find<ExampleCoreController>().products;
    final service = ApplePayService.instance();

    Get.put(ExampleApplePayProcessor(products, service));
    Get.put(ExampleBlikCodeProcessor());
    Get.put(ExampleBlikTokenProcessor());
    Get.put(ExampleCardTokenProcessor());
    Get.put(ExampleInstallmentsProcessor());
    Get.put(ExamplePayByLinkProcessor());
    Get.put(ExampleMethodProcessor(Get.find(), Get.find(), Get.find(), Get.find(), Get.find(), Get.find()));
    Get.put(ExampleMethodController(Get.find(), Get.find(), Get.find(), Get.find()));
  }
}
