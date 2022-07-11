import 'package:example/core/ui/snackbar.dart';
import 'package:example/features/demo_payment_widget/demo_payment_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payu/payu.dart';

class DemoPaymentWidgetPage extends GetView<DemoPaymentWidgetController> implements PaymentMethodsListener {
  const DemoPaymentWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PayuImage.logo(),
      ),
      body: SafeArea(
        child: controller.obx(
          (state) => Column(
            children: [
              if (controller.configuration() != null)
                PaymentMethodsWidget(
                  configuration: controller.configuration()!,
                  service: controller.service,
                  storage: controller.storage,
                  listener: this,
                  onSelect: (value) => controller.didSelectPaymentMethod(value),
                ),
              Visibility(
                visible: controller.method() != null,
                child: TextButton(
                  onPressed: () => controller.didTapPay(),
                  child: const Text('Pay'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didDeletePaymentMethod(PaymentMethod paymentMethod) {
    snackbar('didDeletePaymentMethod: ${paymentMethod.toString()}');
  }
}
