import 'dart:io';

import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';

import 'package:payu_web_payments/payu_web_payments.dart';
import 'package:payu_web_payments/src/matchers/three_ds_uri_matcher.dart';
import 'matchers/pay_by_link_uri_matcher.dart';
import 'matchers/web_payments_uri_matcher.dart';
import 'web_payments_controller.dart';

class WebPaymentsAssembler extends PayuAssembler {
  final WebPaymentsControllerDelegate delegate;
  final WebPaymentsRequest request;

  WebPaymentsAssembler(this.delegate, this.request);

  @override
  void assemble() {
    register(() => PayuLauncher());
    if (request.type == WebPaymentsRequestType.payByLink) {
      register<WebPaymentsUriMatcher>(() => PayByLinkUriMatcher(request.continueUri, Platform.isIOS));
    }
    if (request.type == WebPaymentsRequestType.threeDS) {
      register<WebPaymentsUriMatcher>(() => ThreeDSUriMatcher(request.continueUri));
    }
    register(() => WebPaymentsController(delegate, request, find(), find()));
    super.assemble();
  }

  @override
  void dispose() {
    unregister<PayuLauncher>();
    unregister<WebPaymentsUriMatcher>();
    unregister<WebPaymentsController>();
    super.dispose();
  }
}
