import 'package:flutter/material.dart';
import 'package:payu_add_card/payu_add_card.dart';
import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';
import 'package:payu_ui/payu_ui.dart';

import '../../payment_methods_configuration.dart';
import '../core/payment_methods_item.dart';
import '../core/payment_methods_storage.dart';
import '../pbl_payment_methods/pbl_payment_methods_page.dart';
import 'payment_methods_assembler.dart';
import 'payment_methods_controller.dart';
import 'payment_methods_listener.dart';

class PaymentMethodsPage extends StatefulWidget {
  final PaymentMethodsConfiguration configuration;
  final PaymentMethodsListener listener;
  final PaymentMethodsStorage storage;

  const PaymentMethodsPage({
    Key? key,
    required this.configuration,
    required this.listener,
    required this.storage,
  }) : super(key: key);

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> implements PaymentMethodsControllerDelegate {
  late final assembler = PaymentMethodsAssembler(this, widget.configuration, widget.listener, widget.storage);
  late final controller = assembler.find<PaymentMethodsController>();

  @override
  Widget build(BuildContext context) {
    return PayuWidget<PaymentMethodsController, PaymentMethodsAssembler>(
      assembler: () => assembler,
      builder: (context, controller) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: PayuImage.logo(),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.only(
            top: PayuPadding.padding16,
            bottom: PayuPadding.padding32,
          ),
          itemCount: controller.items.length,
          itemBuilder: (context, index) => controller.canDismissPaymentMethod(controller.items[index])
              ? _DismissibleListTile(
                  value: controller.items[index],
                  onTap: () => controller.didSelectPaymentMethod(controller.items[index]),
                  onDismissed: (direction) => controller.dismissPaymentMethod(controller.items[index]),
                )
              : _ListTile(
                  value: controller.items[index],
                  onTap: () => controller.didSelectPaymentMethod(controller.items[index]),
                ),
        ),
      ),
    );
  }

  @override
  void didComplete(PaymentMethod paymentMethod) {
    Navigator.of(context).pop(paymentMethod);
  }

  @override
  void navigateToBankTransfer() async {
    final payByLink = await Navigator.of(context).push<PayByLink>(
      MaterialPageRoute(
        builder: (context) => PBLPaymentMethodsPage(
          configuration: widget.configuration,
        ),
      ),
    );

    if (payByLink != null) controller.didSelectBankTransfer(payByLink);
  }

  @override
  void navigateToCardToken() async {
    final cardToken = await Navigator.of(context).push<CardToken>(
      MaterialPageRoute(
        builder: (context) => const AddCardPage(),
      ),
    );

    if (cardToken != null) controller.didSelectCardToken(cardToken);
  }
}

class _DismissibleListTile extends StatelessWidget {
  final PaymentMethodsItem value;
  final VoidCallback onTap;
  final Function(DismissDirection) onDismissed;

  const _DismissibleListTile({
    Key? key,
    required this.value,
    required this.onTap,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(value.hash),
      background: const SizedBox(),
      secondaryBackground: Container(
        alignment: AlignmentDirectional.centerEnd,
        padding: const EdgeInsets.symmetric(
          horizontal: PayuPadding.padding16,
        ),
        color: PayuColors.tertiary2,
        child: const Icon(
          Icons.delete_outline,
          color: PayuColors.secondaryGray4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: onDismissed,
      child: _ListTile(
        value: value,
        onTap: onTap,
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  final PaymentMethodsItem value;
  final VoidCallback onTap;

  const _ListTile({Key? key, required this.value, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: PayuPadding.padding4,
        horizontal: PayuPadding.padding16,
      ),
      child: Card(
        child: ListTile(
          leading: SizedBox(
            height: double.infinity,
            child: PayuFadeInImage(
              uri: value.brandImageProvider.light,
              icon: value.brandImageProvider.icon,
              size: value.brandImageProviderSize,
            ),
          ),
          title: Text(value.title),
          subtitle: value.subtitle == null ? null : Text(value.subtitle!),
          enabled: value.enabled,
          onTap: onTap,
        ),
      ),
    );
  }
}
