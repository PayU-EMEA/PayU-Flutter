import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/features/demo_web_payments_secure/demo_web_payments_secure_controller.dart';

class DemoWebPaymentsSecurePage extends GetView<DemoWebPaymentsSecureController> {
  const DemoWebPaymentsSecurePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PayuImage.logo(),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(controller.items[index]),
          onTap: () => controller.didTapItem(index),
        ),
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemCount: controller.items.length,
      ),
    );
  }
}
