import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/core/ui/snackbar.dart';

class DemoMastercardInstallmentsController extends GetxController {
  void demoVaryingNumberOfInstallments() async {
    _demo(await _loadVaryingNumberOfInstallments());
  }

  void demoVaryingNumberOfOptions() async {
    _demo(await _loadVaryingNumberOfOptions());
  }

  void _demo(InstallmentProposal proposal) async {
    final result = await Get.to<InstallmentResult>(() => InstallmentsOfferPage(proposal: proposal));
    if (result != null) snackbar(result.toString());
  }
}

extension _DemoMastercardInstallmentsControllerExt on DemoMastercardInstallmentsController {
  Future<InstallmentProposal> _loadVaryingNumberOfInstallments() async {
    final source = await rootBundle.loadString('lib/mock/mastercard_installments_vnoi.json');
    return InstallmentProposal.fromJson(jsonDecode(source));
  }

  Future<InstallmentProposal> _loadVaryingNumberOfOptions() async {
    final source = await rootBundle.loadString('lib/mock/mastercard_installments_vnoo.json');
    return InstallmentProposal.fromJson(jsonDecode(source));
  }
}
