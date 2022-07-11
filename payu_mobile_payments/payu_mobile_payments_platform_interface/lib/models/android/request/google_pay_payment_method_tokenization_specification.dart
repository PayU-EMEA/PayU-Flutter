import 'google_pay_payment_method_tokenization_specification_parameters.dart';

class GooglePayPaymentMethodTokenizationSpecification {
  static const typePaymentGateway = 'PAYMENT_GATEWAY';

  final String type;
  final GooglePayPaymentMethodTokenizationSpecificationParameters parameters;

  const GooglePayPaymentMethodTokenizationSpecification({
    required this.type,
    required this.parameters,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'parameters': parameters.toJson(),
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
