import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:example/features/example/features/method/example_method_controller.dart';

class ExampleMethodPage extends GetView<ExampleMethodController> {
  const ExampleMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExampleMethodPage'),
      ),
      body: SafeArea(
        child: controller.obx(
          (state) => Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: () => controller.didTapOpenPaymentMethods(),
                  child: const Text('Open Payment Methods'),
                ),
                TextButton(
                  onPressed: () => controller.didTapOpenTestCards(),
                  child: const Text('Open Test Cards'),
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
