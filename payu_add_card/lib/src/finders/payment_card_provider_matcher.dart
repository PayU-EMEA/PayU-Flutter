import 'package:payu_core/payu_core.dart';

import '../models/payment_card_provider.dart';

class PaymentCardProviderMatcher {
  final PaymentCardProvider provider;
  final List<int> lengths;
  final RegExp regExp;

  const PaymentCardProviderMatcher({
    required this.provider,
    required this.lengths,
    required this.regExp,
  });

  factory PaymentCardProviderMatcher.maestro() {
    return PaymentCardProviderMatcher(
      provider: PaymentCardProvider.maestro(),
      lengths: [for (var i = 12; i <= 19; i++) i],
      regExp: RegExp(r'^(06|5[0678]|6)'),
    );
  }

  factory PaymentCardProviderMatcher.mastercard() {
    return PaymentCardProviderMatcher(
      provider: PaymentCardProvider.mastercard(),
      lengths: [16],
      regExp: RegExp(r'^(5[1-5]|2[2-7])'),
    );
  }

  factory PaymentCardProviderMatcher.visa() {
    return PaymentCardProviderMatcher(
      provider: PaymentCardProvider.visa(),
      lengths: [13, 16],
      regExp: RegExp(r'^4'),
    );
  }

  bool hasMatch(String value) {
    final matchesLength = lengths.contains(value.digitsOnly.length);
    final matchesRegExp = regExp.hasMatch(value.digitsOnly);
    return matchesLength && matchesRegExp;
  }
}
