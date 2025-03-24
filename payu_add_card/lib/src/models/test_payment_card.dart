class TestPaymentCard {
  final String number;
  final String expirationMonth;
  final String expirationYear;
  final String cvv;

  final String is3DSecure;
  final String behavior;

  const TestPaymentCard({
    required this.number,
    required this.expirationMonth,
    required this.expirationYear,
    required this.cvv,
    required this.is3DSecure,
    required this.behavior,
  });

  factory TestPaymentCard.fromJson(Map<String, dynamic> json) {
    return TestPaymentCard(
      number: json['number'],
      expirationMonth: json['expirationMonth'],
      expirationYear: json['expirationYear'],
      cvv: json['cvv'],
      is3DSecure: json['is3DSecure'],
      behavior: json['behavior'],
    );
  }
}
