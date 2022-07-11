import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/features/demo_add_card_widget/demo_add_card_widget_controller.dart';

class DemoAddCardWidgetPage extends GetView<DemoAddCardWidgetController> {
  const DemoAddCardWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PayuImage.logo(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddCardWidget(
                configuration: AddCardWidgetConfiguration.payu(),
                onCreated: (service) => controller.didUpdateService(service),
              ),
              const TermsAndConditionsWidget(),
              TextButton(
                onPressed: () => controller.tokenize(false),
                child: const Text('Save'),
              ),
              TextButton(
                onPressed: () => controller.tokenize(true),
                child: const Text('Save and use'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
