import 'google_pay_card_parameters.dart';
import 'google_pay_payment_method_tokenization_specification.dart';

class GooglePayPaymentMethod {
  static const typeCard = 'CARD';

  final String type;
  final GooglePayCardParameters parameters;
  final GooglePayPaymentMethodTokenizationSpecification tokenizationSpecification;

  const GooglePayPaymentMethod({
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
