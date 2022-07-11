import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:payu_add_card/src/finders/payment_card_provider_finder.dart';
import 'package:payu_add_card/src/helpers/card_luhn_validator.dart';
import 'package:payu_add_card/src/models/payment_card_provider.dart';
import 'payment_card_provider_finder_test.mocks.dart';

@GenerateMocks([
  CardLuhnValidator,
])
void main() {
  group('`PaymentCardProviderFinder`', () {
    late MockCardLuhnValidator validator;
    late PaymentCardProviderFinder sut;

    setUp(() {
      validator = MockCardLuhnValidator();
      sut = PaymentCardProviderFinder(validator);
    });

    group('`find`', () {
      test('should return valid provider known card numbers', () {
        when(validator.hasMatch(any)).thenReturn(true);

        expect(sut.find('6771 7980 2100 0008'), equals(PaymentCardProvider.maestro()));
        expect(sut.find('2222 4000 7000 0005'), equals(PaymentCardProvider.mastercard()));
        expect(sut.find('4988 4388 4388 4305'), equals(PaymentCardProvider.visa()));
      });

      test('should return null provider unknown card numbers', () {
        when(validator.hasMatch(any)).thenReturn(true);

        expect(sut.find('3700 0000 0000 002'), equals(null));
        expect(sut.find('3700 0000 0100 018'), equals(null));
        expect(sut.find('8171 9999 2766 0000'), equals(null));
        expect(sut.find('8171 9999 0000 0000 021'), equals(null));
        expect(sut.find('3600 6666 3333 44'), equals(null));
        expect(sut.find('3569 9900 1009 5841'), equals(null));
      });
    });
  });
}
