import 'package:flutter/material.dart';

import 'package:payu_about/payu_about.dart';
import 'package:payu_state_management/payu_state_management.dart';
import 'package:payu_ui/payu_ui.dart';

import '../../payment_methods_configuration.dart';
import 'pbl_payment_methods_assembler.dart';
import 'pbl_payment_methods_controller.dart';

class PBLPaymentMethodsPage extends StatelessWidget {
  final PaymentMethodsConfiguration configuration;

  const PBLPaymentMethodsPage({Key? key, required this.configuration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PayuWidget<PBLPaymentMethodsController, PBLPaymentMethodsAssembler>(
      assembler: () => PBLPaymentMethodsAssembler(configuration),
      builder: (context, controller) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: PayuImage.logo(),
          actions: [
            PayuAppBarIcon.info(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => const AboutPage(),
              ),
            ),
          ],
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(PayuPadding.padding8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: controller.items.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(PayuPadding.padding4),
            child: Opacity(
              opacity: controller.items[index].enabled ? 1 : 0.25,
              child: Card(
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(controller.items[index].value),
                  enableFeedback: false,
                  child: Padding(
                    padding: const EdgeInsets.all(PayuPadding.padding8),
                    child: PayuFadeInImage(
                      uri: controller.items[index].brandImageProvider.light,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
