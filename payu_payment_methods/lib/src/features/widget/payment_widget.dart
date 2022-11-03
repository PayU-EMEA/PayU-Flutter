import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';
import 'package:payu_translations/payu_translations.dart';
import 'package:payu_ui/payu_ui.dart';

import '../../payment_methods_configuration.dart';
import '../core/payment_methods_storage.dart';
import '../payment_methods/payment_methods_listener.dart';
import '../payment_methods/payment_methods_page.dart';
import 'payment_widget_assembler.dart';
import 'payment_widget_controller.dart';
import 'payment_widget_service.dart';
import 'payment_widget_state.dart';

class PaymentMethodsWidget extends StatelessWidget {
  final PaymentMethodsConfiguration configuration;
  final PaymentWidgetService service;
  final PaymentMethodsStorage storage;
  final PaymentMethodsListener listener;
  final Function(PaymentMethod) onSelect;

  const PaymentMethodsWidget({
    Key? key,
    required this.configuration,
    required this.service,
    required this.storage,
    required this.listener,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PayuWidget<PaymentWidgetController, PaymentWidgetAssembler>(
      assembler: () => PaymentWidgetAssembler(configuration, service, storage, listener),
      builder: (context, controller) => Container(
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PayuPadding.padding4,
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  final result = await Navigator.of(context).push<PaymentMethod>(
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodsPage(
                        configuration: configuration,
                        listener: listener,
                        storage: storage,
                      ),
                    ),
                  );

                  if (result != null) {
                    controller.didSelect(result);
                    onSelect(result);
                  }
                },
                child: Row(
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          const _Logo(),
                          const _Divider(),
                          if (controller.selected == null) _Empty(controller: controller),
                          if (controller.selected != null) _Icon(controller: controller),
                          if (controller.selected != null) _Info(controller: controller),
                        ],
                      ),
                    ),
                    _Arrow(controller: controller),
                  ],
                ),
              ),
              if (controller.state == PaymentWidgetState.blikCode) _BlikCode(controller: controller),
              if (controller.state == PaymentWidgetState.blikToken) _BlikToken(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PayuImage.logo();
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        width: 1,
        height: 24,
        color: PayuColors.secondaryGray3,
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  final PaymentWidgetController controller;

  const _Empty({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        'select_payment_method'.translated(),
        style: Theme.of(context).textTheme.subtitle2,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  final PaymentWidgetController controller;

  const _Icon({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: PayuFadeInImage(
        uri: controller.url,
        size: 48,
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final PaymentWidgetController controller;

  const _Info({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (controller.name != null)
              Flexible(
                child: Text(
                  controller.name ?? '',
                  style: Theme.of(context).textTheme.subtitle2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            if (controller.description != null)
              Text(
                controller.description!,
                style: Theme.of(context).textTheme.bodyText2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
          ],
        ),
      ),
    );
  }
}

class _Arrow extends StatelessWidget {
  final PaymentWidgetController controller;

  const _Arrow({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: PayuPadding.padding8),
      child: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class _BlikCode extends StatelessWidget {
  final PaymentWidgetController controller;

  const _BlikCode({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PayuPadding.padding16),
      child: TextField(
        controller: controller.textEditingController,
        decoration: InputDecoration(
          hintText: 'enter_blik_code'.translated(),
        ),
        maxLength: PaymentWidgetController.maxLength,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }
}

class _BlikToken extends StatelessWidget {
  final PaymentWidgetController controller;

  const _BlikToken({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => controller.didTapEnterNewBlikCode(),
      child: Text('enter_new_blik_code'.translated()),
    );
  }
}
