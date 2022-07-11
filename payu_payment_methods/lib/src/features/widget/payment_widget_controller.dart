import 'package:flutter/material.dart';
import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';

import '../../payment_methods_configuration.dart';
import '../core/payment_methods_storage.dart';
import '../payment_methods/payment_methods_listener.dart';
import 'payment_widget_service.dart';
import 'payment_widget_state.dart';

class PaymentWidgetController extends PayuController implements PaymentWidgetServiceDelegate {
  static const maxLength = 6;

  final PaymentMethodsConfiguration configuration;
  final PaymentWidgetService service;
  final PaymentMethodsStorage storage;
  final PaymentMethodsListener listener;

  final textEditingController = TextEditingController();

  PaymentWidgetState state = PaymentWidgetState.initial;
  PaymentMethod? selected;

  String? get url => selected?.brandImageProvider.light;
  String? get name => selected?.name;
  String? get description => selected?.description;

  PaymentWidgetController(this.configuration, this.service, this.storage, this.listener);

  @override
  void onInit() {
    service.delegate = this;
    super.onInit();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void didSelect(PaymentMethod paymentMethod) async {
    _updatePaymentMethod(paymentMethod);
    _updateWidgetState();
    notifyListeners();
  }

  void didTapEnterNewBlikCode() {
    state = PaymentWidgetState.blikCode;
    notifyListeners();
  }

  @override
  String? blikAuthorizationCode() {
    final authorizationCode = textEditingController.text;
    return authorizationCode.length == maxLength ? authorizationCode : null;
  }

  @override
  bool isBlikAuthorizationCodeRequired() {
    return selected is BlikCode;
  }

  void _updatePaymentMethod(PaymentMethod value) {
    textEditingController.clear();
    selected = value;
  }

  void _updateWidgetState() {
    if (selected is BlikCode) {
      state = PaymentWidgetState.blikCode;
      return;
    }
    if (selected is BlikToken) {
      state = PaymentWidgetState.blikToken;
      return;
    }
    state = PaymentWidgetState.initial;
  }
}
