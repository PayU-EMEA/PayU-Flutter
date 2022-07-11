import 'package:example/features/demo_payment_widget/demo_payment_widget_controller.dart';
import 'package:get/get.dart';
import 'package:payu/payu.dart';

class DemoPaymentWidgetBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PayuMobilePayments());
    Get.put(PaymentWidgetService());
    Get.put(DemoPaymentWidgetController(Get.find(), Get.find(), Get.find(), Get.find()));
  }
}
