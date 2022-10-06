// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:payu_state_management/payu_state_management.dart';

import '../../../payu_mastercard_installments.dart';
import '../options/installments_options_page.dart';

class InstallmentsOfferController extends PayuController {
  final InstallmentProposal proposal;

  InstallmentsOfferController(this.proposal);

  void didTapSplitIntoInstallmentsPage(BuildContext context) async {
    final result = await Navigator.of(context).push<InstallmentResult>(
      MaterialPageRoute(
        builder: (context) => InstallmentsOptionsPage(
          proposal: proposal,
        ),
      ),
    );

    if (result != null) Navigator.of(context).pop(result);
  }

  void didTapNoThanks(BuildContext context) async {
    Navigator.of(context).pop();
  }
}
