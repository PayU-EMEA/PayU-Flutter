import 'package:payu_core/payu_core.dart';

class PaymentMethodsProcessor {
  void process({
    required PaymentMethod method,
    required Function(ApplePay) onApplePay,
    required Function(BlikCode) onBlikCode,
    required Function(BlikToken) onBlikToken,
    required Function(CardToken) onCardToken,
    required Function(GooglePay) onGooglePay,
    required Function(Installments) onInstallments,
    required Function(PayByLink) onPayByLink,
    Function(PaymentMethod)? onOther,
  }) {
    if (method is ApplePay) {
      onApplePay(method);
      return;
    }
    if (method is BlikCode) {
      onBlikCode(method);
      return;
    }
    if (method is BlikToken) {
      onBlikToken(method);
      return;
    }
    if (method is CardToken) {
      onCardToken(method);
      return;
    }
    if (method is GooglePay) {
      onGooglePay(method);
      return;
    }
    if (method is Installments) {
      onInstallments(method);
      return;
    }
    if (method is PayByLink) {
      onPayByLink(method);
      return;
    }

    if (onOther != null) {
      onOther(method);
      return;
    }
  }
}
