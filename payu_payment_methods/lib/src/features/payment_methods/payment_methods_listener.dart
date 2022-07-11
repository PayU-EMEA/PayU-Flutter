import 'package:payu_core/payu_core.dart';

abstract class PaymentMethodsListener {
  void didDeletePaymentMethod(PaymentMethod paymentMethod);
}
