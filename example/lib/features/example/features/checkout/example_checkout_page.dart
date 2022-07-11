import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:example/features/example/features/checkout/example_checkout_controller.dart';

class ExampleCheckoutPage extends GetView<ExampleCheckoutController> {
  const ExampleCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExampleCheckoutPage'),
      ),
      body: SafeArea(
        child: controller.obx(
          (state) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => controller.didTapGoToCheckoutPayment(),
                  child: const Text('Checkout'),
                ),
                TextButton(
                  onPressed: () => controller.didTapGoToInstallments(),
                  child: const Text('Check Pay in installments with Mastercard'),
                ),
              ],
            ),
          ),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
