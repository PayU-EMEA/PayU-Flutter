import 'package:flutter_test/flutter_test.dart';

import 'package:payu_add_card/src/helpers/card_date_parser.dart';

void main() {
  group('`CardDateParser`', () {
    late CardDateParser sut;

    setUp(() {
      sut = CardDateParser();
    });

    group('`parse`', () {
      test('should return date for correct short style value', () {
        expect(sut.parse('01/01'), DateTime(2001, 1));
        expect(sut.parse('01/19'), DateTime(2019, 1));
        expect(sut.parse('01/26'), DateTime(2026, 1));
      });

      test('should return date for correct long style value', () {
        expect(sut.parse('01/2001'), DateTime(2001, 1));
        expect(sut.parse('01/2019'), DateTime(2019, 1));
        expect(sut.parse('01/3026'), DateTime(3026, 1));
      });
    });
  });
}
