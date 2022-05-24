class PaymentProvider {
  static const applePay = PaymentProvider._('applePay');
  static const googlePay = PaymentProvider._('googlePay');

  final String value;

  const PaymentProvider._(this.value);
}
