import 'package:flutter_test/flutter_test.dart';

import 'package:payu_add_card/src/network/models/token_create_request.dart';
import 'package:payu_add_card/src/network/models/token_create_request_data_card.dart';
import 'package:payu_add_card/src/network/models/token_type.dart';

void main() {
  group('TokenType', () {
    test('should expose API string values', () {
      expect(TokenType.single.value, equals('SINGLE'));
      expect(TokenType.multi.value, equals('MULTI'));
      expect(TokenType.singleLongterm.value, equals('SINGLE_LONGTERM'));
    });
  });

  group('TokenCreateRequest', () {
    group('`toJson`', () {
      test('should map model correctly', () {
        const model = TokenCreateRequest(
          posId: '0123456789',
          save: true,
          card: TokenCreateRequestDataCard(
            number: '5434021016824014',
            expirationMonth: '12',
            expirationYear: '29',
            cvv: '123',
          ),
        );

        final json = model.toJson();
        final card = json['card'] as TokenCreateRequestDataCard;

        expect(json['posId'], equals(model.posId));
        expect(json['type'], equals(TokenType.multi.value));

        expect(card.number, equals(model.card.number));
        expect(card.expirationMonth, equals(model.card.expirationMonth));
        expect(card.expirationYear, equals(model.card.expirationYear));
        expect(card.cvv, equals(model.card.cvv));
      });

      test('when `save` is false then should map `type` to `SINGLE_LONGTERM`', () {
        const model = TokenCreateRequest(
          posId: '0123456789',
          save: false,
          card: TokenCreateRequestDataCard(
            number: '5434021016824014',
            expirationMonth: '12',
            expirationYear: '29',
            cvv: '123',
          ),
        );

        final json = model.toJson();

        expect(json['type'], equals(TokenType.singleLongterm.value));
      });
    });
  });
}
