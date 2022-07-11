class PaymentEnvironment {
  static const production = PaymentEnvironment._('production');
  static const test = PaymentEnvironment._('test');

  final String value;

  const PaymentEnvironment._(this.value);
}
