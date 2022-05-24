import 'payment_method_parameters.dart';
import 'payment_method_tokenization_specification.dart';

class PaymentMethod {
  static const paymentMethodTypeCard = 'CARD';

  final String type;
  final PaymentMethodParameters parameters;
  final PaymentMethodTokenizationSpecification tokenizationSpecification;

  const PaymentMethod({
    required this.type,
    required this.parameters,
    required this.tokenizationSpecification,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'parameters': parameters.toJson(),
      'tokenizationSpecification': tokenizationSpecification.toJson(),
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
