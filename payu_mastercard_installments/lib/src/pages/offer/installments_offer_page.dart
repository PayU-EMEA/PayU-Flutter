import 'package:flutter/material.dart';
import 'package:payu_about/payu_about.dart';
import 'package:payu_state_management/payu_state_management.dart';
import 'package:payu_translations/payu_translations.dart';
import 'package:payu_ui/payu_ui.dart';

import '../../core/widgets/installments_header_widget.dart';
import '../../models/installment_proposal.dart';
import 'installments_offer_assembler.dart';
import 'installments_offer_controller.dart';

class InstallmentsOfferPage extends StatelessWidget {
  final InstallmentProposal proposal;

  const InstallmentsOfferPage({Key? key, required this.proposal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PayuWidget<InstallmentsOfferController, InstallmentsOfferAssembler>(
      assembler: () => InstallmentsOfferAssembler(proposal),
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
        body: Padding(
          padding: const EdgeInsets.all(PayuPadding.padding16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InstallmentsHeaderWidget(),
              Padding(
                padding: const EdgeInsets.only(bottom: PayuPadding.padding16),
                child: Text(
                  'transaction_approved'.translated(),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: PayuPadding.padding8),
                child: Text(
                  'the_recipient_will_get_the_total_order_amount'.translated(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: PayuPadding.padding16),
                child: Text('you_can_split_this_payment_into_installments_with_mastercard'.translated()),
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => controller.didTapSplitIntoInstallmentsPage(context),
                  child: Text('split_into_installments'.translated()),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: OutlinedButton(
                  onPressed: () => controller.didTapNoThanks(context),
                  child: Text('no_thanks'.translated()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
