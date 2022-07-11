import 'test_payment_card.dart';

class PaymentCard {
  final String number;
  final String expirationMonth;
  final String expirationYear;
  final String cvv;

  const PaymentCard({
    required this.number,
    required this.expirationMonth,
    required this.expirationYear,
    required this.cvv,
  });

  factory PaymentCard.fromJson(Map<String, dynamic> json) {
    return PaymentCard(
      number: json['number'],
      expirationMonth: json['expirationMonth'],
      expirationYear: json['expirationYear'],
      cvv: json['cvv'],
    );
  }

  factory PaymentCard.fromTestPaymentCard(TestPaymentCard value) {
    return PaymentCard(
      number: value.number,
      expirationMonth: value.expirationMonth,
      expirationYear: value.expirationYear,
      cvv: value.cvv,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'expirationMonth': expirationMonth,
      'expirationYear': expirationYear,
      'cvv': cvv,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
