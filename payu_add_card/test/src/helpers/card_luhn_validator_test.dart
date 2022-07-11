import 'package:flutter_test/flutter_test.dart';

import 'package:payu_add_card/src/helpers/card_luhn_validator.dart';

void main() {
  group('`CardLuhnValidator`', () {
    late CardLuhnValidator sut;

    setUp(() {
      sut = CardLuhnValidator();
    });

    group('`hasMatch`', () {
      test('should return `true` for correct card numbers', () {
        expect(sut.hasMatch('4444333322221111'), true);
        expect(sut.hasMatch('5434021016824014'), true);
        expect(sut.hasMatch('5598614816563766'), true);
        expect(sut.hasMatch('5099802211165618'), true);
        expect(sut.hasMatch('4012001037141112'), true);
      });

      test('should return `false` for invalid card numbers', () {
        expect(sut.hasMatch('1234123412341234'), false);
        expect(sut.hasMatch('1111000033332222'), false);
        expect(sut.hasMatch('1234567812345678'), false);
        expect(sut.hasMatch('abcd'), false);
      });
    });
  });
}
