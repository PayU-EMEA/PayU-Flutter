import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:payu_add_card/src/finders/payment_card_provider_matcher.dart';
import 'package:payu_add_card/src/helpers/card_luhn_validator.dart';
import 'package:payu_add_card/src/models/payment_card_provider.dart';

@GenerateMocks([
  CardLuhnValidator,
])
void main() {
  group('`PaymentCardProviderFactory`', () {
    late PaymentCardProviderMatcher sut;

    group('`maestro`', () {
      setUp(() {
        sut = PaymentCardProviderMatcher.maestro();
      });

      test('should return `maestro` provider for Maestro card numbers', () {
        expect(sut.provider, equals(PaymentCardProvider.maestro()));

        expect(sut.hasMatch('value'), equals(false));
        expect(sut.hasMatch('6771 7980 2100 0008'), equals(true));
      });
    });

    group('`mastercard`', () {
      setUp(() {
        sut = PaymentCardProviderMatcher.mastercard();
      });

      test('should return `mastercard` provider for Mastercard card numbers', () {
        expect(sut.provider, equals(PaymentCardProvider.mastercard()));

        expect(sut.hasMatch('value'), equals(false));
        expect(sut.hasMatch('2222 4000 7000 0005'), equals(true));
        expect(sut.hasMatch('5555 3412 4444 1115'), equals(true));
        expect(sut.hasMatch('5577 0000 5577 0004'), equals(true));
        expect(sut.hasMatch('5555 4444 3333 1111'), equals(true));
        expect(sut.hasMatch('2222 4107 4036 0010'), equals(true));
        expect(sut.hasMatch('5555 5555 5555 4444'), equals(true));
        expect(sut.hasMatch('2222 4107 0000 0002'), equals(true));
        expect(sut.hasMatch('2222 4000 1000 0008'), equals(true));
        expect(sut.hasMatch('2223 0000 4841 0010'), equals(true));
        expect(sut.hasMatch('5100 0600 0000 0002'), equals(true));
      });
    });

    group('`visa`', () {
      setUp(() {
        sut = PaymentCardProviderMatcher.visa();
      });

      test('should return `visa` provider for Visa card numbers', () {
        expect(sut.provider, equals(PaymentCardProvider.visa()));

        expect(sut.hasMatch('value'), equals(false));
        expect(sut.hasMatch('4111 1111 4555 1142'), equals(true));
        expect(sut.hasMatch('4988 4388 4388 4305'), equals(true));
        expect(sut.hasMatch('4166 6766 6766 6746'), equals(true));
        expect(sut.hasMatch('4646 4646 4646 4644'), equals(true));
        expect(sut.hasMatch('4000 6200 0000 0007'), equals(true));
        expect(sut.hasMatch('4000 0600 0000 0006'), equals(true));
        expect(sut.hasMatch('4293 1891 0000 0008'), equals(true));
        expect(sut.hasMatch('4111 1111 1111 1111'), equals(true));
        expect(sut.hasMatch('4001 5900 0000 0001'), equals(true));
        expect(sut.hasMatch('4000 1800 0000 0002'), equals(true));
      });
    });
  });
}
