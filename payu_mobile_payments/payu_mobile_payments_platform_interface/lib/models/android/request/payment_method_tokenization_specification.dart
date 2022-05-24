import 'payment_method_tokenization_specification_parameters.dart';

class PaymentMethodTokenizationSpecification {
  static const tokenizationSpecificationTypePaymentGateway = 'PAYMENT_GATEWAY';

  final String type;
  final PaymentMethodTokenizationSpecificationParameters parameters;

  const PaymentMethodTokenizationSpecification({
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
