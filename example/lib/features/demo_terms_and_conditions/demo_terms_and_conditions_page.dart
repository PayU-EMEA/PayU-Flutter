import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/features/demo_terms_and_conditions/demo_terms_and_conditions_controller.dart';

class DemoTermsAndConditionsPage extends GetView<DemoTermsAndConditionsController> {
  const DemoTermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PayuImage.logo(),
      ),
      body: const TermsAndConditionsWidget(),
    );
  }
}
