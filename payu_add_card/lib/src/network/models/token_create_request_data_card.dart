import '../../models/payment_card.dart';

class TokenCreateRequestDataCard {
  final String number;
  final String expirationMonth;
  final String expirationYear;
  final String cvv;

  const TokenCreateRequestDataCard({
    required this.number,
    required this.expirationMonth,
    required this.expirationYear,
    required this.cvv,
  });

  factory TokenCreateRequestDataCard.fromPaymentCard(PaymentCard value) {
    return TokenCreateRequestDataCard(
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
