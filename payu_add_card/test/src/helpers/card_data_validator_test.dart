import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:payu_add_card/src/exceptions/add_card_exception.dart';
import 'package:payu_add_card/src/finders/payment_card_provider_finder.dart';
import 'package:payu_add_card/src/helpers/card_data_validator.dart';
import 'package:payu_add_card/src/helpers/card_date_parser.dart';
import 'package:payu_add_card/src/models/payment_card_provider.dart';
import 'card_data_validator_test.mocks.dart';

@GenerateMocks([
  CardDateParser,
  PaymentCardProviderFinder,
])
void main() {
  late CardDataValidator sut;

  group('`CardCVVValidator`', () {
    setUp(() {
      sut = CardCVVValidator();
    });

    group('`validate`', () {
      test('should throw error when `value` is null', () {
        expect(() => sut.validate(null), throwsA(isA<AddCardException>()));
      });

      test('should throw error when `value` is empty', () {
        expect(() => sut.validate(''), throwsA(isA<AddCardException>()));
      });

      test('should throw error when `value` is not length of 3', () {
        expect(() => sut.validate('1'), throwsA(isA<AddCardException>()));
        expect(() => sut.validate('12'), throwsA(isA<AddCardException>()));
        expect(() => sut.validate('1234'), throwsA(isA<AddCardException>()));
      });

      test('should return normally when `value` is length of 3', () {
        expect(() => sut.validate('123'), returnsNormally);
      });
    });
  });

  group('`CardDateValidator`', () {
    late MockCardDateParser parser;

    setUp(() {
      parser = MockCardDateParser();
      sut = CardDateValidator(parser);
    });

    group('`validate`', () {
      test('should throw error when `value` is null', () {
        expect(() => sut.validate(null), throwsA(isA<AddCardException>()));
      });

      test('should throw error when `value` is empty', () {
        expect(() => sut.validate(''), throwsA(isA<AddCardException>()));
      });

      test('should throw error when `parser` cannot parse the date', () {
        const value = '0924';

        when(parser.parse(value)).thenReturn(null);
        expect(() => sut.validate(value), throwsA(isA<AddCardException>()));
        verify(parser.parse(value));
      });

      test('should throw error when `parser` returns incorrect date', () {
        const value = '0924';
        final date = DateTime.now().subtract(const Duration(days: 100));

        when(parser.parse(value)).thenReturn(date);
        expect(() => sut.validate(value), throwsA(isA<AddCardException>()));
        verify(parser.parse(value));
      });

      test('should return normally when `parser` returns correct date', () {
        const value = '0924';
        final date = DateTime.now().add(const Duration(days: 100));

        when(parser.parse(value)).thenReturn(date);
        expect(() => sut.validate(value), returnsNormally);
        verify(parser.parse(value));
      });
    });
  });

  group('`CardNumberValidator`', () {
    late MockPaymentCardProviderFinder finder;

    setUp(() {
      finder = MockPaymentCardProviderFinder();
      sut = CardNumberValidator(finder);
    });

    group('`validate`', () {
      test('should throw error when `value` is null', () {
        expect(() => sut.validate(null), throwsA(isA<AddCardException>()));
      });

      test('should throw error when `value` is empty', () {
        expect(() => sut.validate(''), throwsA(isA<AddCardException>()));
      });

      test('should throw error when `validator` cannot validate', () {
        const value = '4444 3333 2222 1111';

        when(finder.find(any)).thenReturn(null);
        expect(() => sut.validate(value), throwsA(isA<AddCardException>()));
        verify(finder.find(value));
      });

      test('should return normally when `validator` can validate', () {
        const value = '4444 3333 2222 1111';

        when(finder.find(any)).thenReturn(PaymentCardProvider.visa());
        expect(() => sut.validate(value), returnsNormally);
        verify(finder.find(value));
      });
    });
  });
}
