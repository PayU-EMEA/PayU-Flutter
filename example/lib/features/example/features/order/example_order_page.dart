import 'package:flutter/material.dart';

import 'package:get/get.dart';

import './example_order_controller.dart';

class ExampleOrderPage extends GetView<ExampleOrderController> {
  const ExampleOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExampleOrderPage'),
      ),
      body: SafeArea(
        child: controller.obx(
          (state) => Center(
            child: TextButton(
              onPressed: () => controller.didTapCreateOrder(),
              child: const Text('Create Order'),
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
