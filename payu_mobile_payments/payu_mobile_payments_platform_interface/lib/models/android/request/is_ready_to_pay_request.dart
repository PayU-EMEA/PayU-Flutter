import 'payment_method.dart';

class IsReadyToPayRequest {
  final int apiVersion;
  final int apiVersionMinor;
  final List<PaymentMethod> allowedPaymentMethods;
  final bool? existingPaymentMethodRequired;

  const IsReadyToPayRequest({
    required this.apiVersion,
    required this.apiVersionMinor,
    required this.allowedPaymentMethods,
    this.existingPaymentMethodRequired,
  });

  Map<String, dynamic> toJson() {
    return {
      'apiVersion': apiVersion,
      'apiVersionMinor': apiVersionMinor,
      'allowedPaymentMethods': allowedPaymentMethods.map((e) => e.toJson()).toList(),
      'existingPaymentMethodRequired': existingPaymentMethodRequired,
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
