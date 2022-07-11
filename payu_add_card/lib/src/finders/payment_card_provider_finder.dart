import '../helpers/card_luhn_validator.dart';
import '../models/payment_card_provider.dart';
import 'payment_card_provider_matcher.dart';

class PaymentCardProviderFinder {
  static final _matchers = [
    PaymentCardProviderMatcher.maestro(),
    PaymentCardProviderMatcher.mastercard(),
    PaymentCardProviderMatcher.visa(),
  ];

  final CardLuhnValidator _validator;

  PaymentCardProviderFinder(this._validator);

  PaymentCardProvider? find(String value) {
    if (!_validator.hasMatch(value)) return null;

    for (final matcher in _matchers) {
      if (matcher.hasMatch(value)) {
        return matcher.provider;
      }
    }

    return null;
  }
}
