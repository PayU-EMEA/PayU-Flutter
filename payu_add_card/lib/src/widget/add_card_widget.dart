import 'package:flutter/material.dart';

import 'package:payu_state_management/payu_state_management.dart';
import 'package:payu_terms_and_conditions/payu_terms_and_conditions.dart';
import 'package:payu_translations/payu_translations.dart';
import 'package:payu_ui/payu_ui.dart';

import '../models/payment_card_provider.dart';
import '../service/add_card_service.dart';
import 'add_card_widget_assembler.dart';
import 'add_card_widget_configuration.dart';
import 'add_card_widget_controller.dart';
import 'widgets/add_card_text_field.dart';

class AddCardWidget extends StatelessWidget {
  final AddCardWidgetConfiguration configuration;
  final Function(AddCardService) onCreated;

  const AddCardWidget({
    super.key,
    required this.configuration,
    required this.onCreated,
  });

  @override
  Widget build(BuildContext context) {
    return PayuWidget<AddCardWidgetController, AddCardWidgetAssembler>(
      assembler: () => AddCardWidgetAssembler(
        onAssembled: (assembler) => onCreated(
          assembler.find<AddCardService>(),
        ),
      ),
      builder: (context, controller) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: PayuPadding.padding8),
                child: Row(
                  children: [
                    Text(
                      'new_card'.translated(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: PayuPadding.padding16),
                        child: Container(
                          height: 1,
                          color: PayuColors.secondaryGray3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: PayuPadding.padding8,
                ),
                child: Wrap(
                  spacing: PayuPadding.padding16,
                  children: PaymentCardProvider.all()
                      .map(
                        (e) => Opacity(
                          opacity: e == controller.cardProvider ? 1 : 0.25,
                          child: PayuFadeInImage(uri: e.brandImageProvider.light, size: 48),
                        ),
                      )
                      .toList(),
                ),
              ),
              AddCardTextField(
                controller: controller.numberController,
                decoration: configuration.numberDecoration,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AddCardTextField(
                      controller: controller.dateController,
                      decoration: configuration.dateDecoration,
                    ),
                  ),
                  const SizedBox(width: PayuPadding.padding16),
                  Expanded(
                    child: AddCardTextField(
                      controller: controller.cvvController,
                      decoration: configuration.cvvDecoration,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: configuration.isFooterVisible,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: PayuPadding.padding16),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: TermsAndConditionsWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
