import 'package:payu_core/payu_core.dart';

class CardLuhnValidator {
  bool hasMatch(String value) {
    final formatted = value.digitsOnly;
    if (formatted.length < 8) return false;

    int sum = 0;
    int length = formatted.length;

    for (var i = 0; i < length; i++) {
      int digit = int.parse(formatted[length - i - 1]);
      if (i % 2 == 1) digit *= 2;
      sum += digit > 9 ? (digit - 9) : digit;
    }

    return sum % 10 == 0;
  }
}
