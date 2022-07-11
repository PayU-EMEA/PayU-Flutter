import 'package:payu_translations/payu_translations.dart';

class AddCardException implements Exception {
  final String message;

  const AddCardException._(this.message);

  factory AddCardException.emptyCVV() => const AddCardException._('enter_cvv');
  factory AddCardException.emptyDate() => const AddCardException._('enter_card_date');
  factory AddCardException.emptyNumber() => const AddCardException._('enter_card_number');

  factory AddCardException.invalidCVV() => const AddCardException._('enter_valid_cvv');
  factory AddCardException.invalidDate() => const AddCardException._('enter_valid_card_date');
  factory AddCardException.invalidNumber() => const AddCardException._('enter_valid_card_number');

  @override
  String toString() => message.translated();
}
