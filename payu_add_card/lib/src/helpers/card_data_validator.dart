import 'package:payu_add_card/src/exceptions/add_card_exception.dart';
import 'package:payu_add_card/src/finders/payment_card_provider_finder.dart';
import 'package:payu_add_card/src/helpers/card_date_parser.dart';

abstract class CardDataValidator {
  void validate(String? value);
}

class CardCVVValidator implements CardDataValidator {
  @override
  void validate(String? value) {
    if (value == null) throw AddCardException.emptyCVV();
    if (value.isEmpty) throw AddCardException.emptyCVV();
    if (value.length != 3) throw AddCardException.invalidCVV();
  }
}

class CardDateValidator implements CardDataValidator {
  final CardDateParser _parser;

  CardDateValidator(this._parser);

  @override
  void validate(String? value) {
    if (value == null) throw AddCardException.emptyDate();
    if (value.isEmpty) throw AddCardException.emptyDate();

    final date = _parser.parse(value);
    if (date == null) throw AddCardException.invalidDate();

    final isValid = date.isAfter(DateTime.now());
    if (!isValid) throw AddCardException.invalidDate();
  }
}

class CardNumberValidator implements CardDataValidator {
  final PaymentCardProviderFinder _finder;

  CardNumberValidator(this._finder);

  @override
  void validate(String? value) {
    if (value == null) throw AddCardException.emptyNumber();
    if (value.isEmpty) throw AddCardException.emptyNumber();

    final provider = _finder.find(value);
    if (provider == null) throw AddCardException.invalidNumber();
  }
}
