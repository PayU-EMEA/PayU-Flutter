import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/features/demo_add_card_widget/demo_add_card_widget_controller.dart';

class DemoAddCardWidgetPage extends StatefulWidget {
  const DemoAddCardWidgetPage({super.key});

  @override
  State<DemoAddCardWidgetPage> createState() => _DemoAddCardWidgetPageState();
}

class _DemoAddCardWidgetPageState extends State<DemoAddCardWidgetPage> {
  late final DemoAddCardWidgetController controller;
  bool _isInstallmentsLoading = false;

  @override
  void initState() {
    super.initState();
    controller = Get.find<DemoAddCardWidgetController>();
  }

  void _didUpdateInstallmentsLoading(bool value) {
    if (_isInstallmentsLoading == value) return;
    setState(() {
      _isInstallmentsLoading = value;
    });
  }

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
                onInstallmentsLoadingChanged: _didUpdateInstallmentsLoading,
              ),
              const TermsAndConditionsWidget(),
              TextButton(
                onPressed: _isInstallmentsLoading ? null : () => controller.tokenize(false),
                child: const Text('Save'),
              ),
              TextButton(
                onPressed: _isInstallmentsLoading ? null : () => controller.tokenize(true),
                child: const Text('Save and use'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
