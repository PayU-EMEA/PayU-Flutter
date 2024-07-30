import 'package:flutter/material.dart';

import 'package:payu_state_management/payu_state_management.dart';
import 'package:payu_translations/payu_translations.dart';
import 'package:payu_ui/payu_ui.dart';

import 'terms_and_conditions_assembler.dart';
import 'terms_and_conditions_controller.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PayuWidget<TermsAndConditionsController, TermsAndConditionsAssembler>(
      assembler: () => TermsAndConditionsAssembler(),
      builder: (context, controller) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.all(PayuPadding.padding16),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'i_accept'.translated(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: ' ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'pay_u_payment_terms'.translated(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          onTap: () => controller.didTap('pay_u_payment_terms_url'.translated()),
        ),
      ),
    );
  }
}
