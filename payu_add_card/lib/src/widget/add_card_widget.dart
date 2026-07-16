import 'package:flutter/material.dart';

import 'package:payu_state_management/payu_state_management.dart';
import 'package:payu_terms_and_conditions/payu_terms_and_conditions.dart';
import 'package:payu_translations/payu_translations.dart';
import 'package:payu_ui/payu_ui.dart';

import '../helpers/installments_label.dart';
import '../models/payment_card_provider.dart';
import '../service/add_card_service.dart';
import 'add_card_widget_assembler.dart';
import 'add_card_widget_configuration.dart';
import 'add_card_widget_controller.dart';
import 'widgets/add_card_text_field.dart';

class AddCardWidget extends StatelessWidget {
  final AddCardWidgetConfiguration configuration;
  final Function(AddCardService) onCreated;
  final ValueChanged<bool>? onInstallmentsLoadingChanged;

  const AddCardWidget({
    super.key,
    required this.configuration,
    required this.onCreated,
    this.onInstallmentsLoadingChanged,
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
              Builder(
                builder: (context) {
                  final isLoading = controller.installments.isLoading;
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    onInstallmentsLoadingChanged?.call(isLoading);
                  });
                  return const SizedBox.shrink();
                },
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
                isAutofillEnable: configuration.isAutofillEnable,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AddCardTextField(
                      controller: controller.dateController,
                      decoration: configuration.dateDecoration,
                      isAutofillEnable: configuration.isAutofillEnable,
                    ),
                  ),
                  const SizedBox(width: PayuPadding.padding16),
                  Expanded(
                    child: AddCardTextField(
                      controller: controller.cvvController,
                      decoration: configuration.cvvDecoration,
                      isAutofillEnable: configuration.isAutofillEnable,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: controller.installments.options.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: PayuPadding.padding8),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'installment_options'.translated(),
                        ),
                        const SizedBox(height: PayuPadding.padding8),
                        Builder(
                          builder: (context) {
                            final options = <int>[1, ...controller.installments.options];

                            if (controller.installments.options.length > 6) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: PayuPadding.padding8),
                                child: DropdownButtonFormField<int>(
                                  value: controller.installments.selectedNumber ?? 1,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.all(PayuPadding.padding16),
                                  ),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  items: options
                                      .map(
                                        (value) => DropdownMenuItem<int>(
                                          value: value,
                                          child: Text(
                                            value == 1 ? 'installments_none'.translated() : InstallmentsLabel.build(value),
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      controller.installments.select(value);
                                    }
                                  },
                                ),
                              );
                            }

                            return LayoutBuilder(
                              builder: (context, constraints) {
                                const spacing = PayuPadding.padding8;
                                final itemWidth = (constraints.maxWidth - spacing) / 2;

                                return Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: spacing,
                                  runSpacing: spacing,
                                  children: options
                                      .map(
                                        (value) => SizedBox(
                                          width: itemWidth,
                                          child: ChoiceChip(
                                            showCheckmark: false,
                                            label: SizedBox(
                                              width: double.maxFinite,
                                              child: Text(
                                                    value == 1 ? 'installments_none'.translated() : InstallmentsLabel.build(value),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            selected: controller.installments.selectedNumber == value,
                                            onSelected: (selected) {
                                              if (selected) {
                                                controller.installments.select(value);
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                      .toList(),
                                );
                              },
                            );
                          },
                        ),
                        Visibility(
                          visible: controller.installments.errorText != null,
                          child: Padding(
                            padding: const EdgeInsets.only(top: PayuPadding.padding8),
                            child: Text(
                              'choose_installment_option'.translated(),
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
