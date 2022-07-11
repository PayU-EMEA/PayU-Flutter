import 'package:flutter_test/flutter_test.dart';

import 'package:payu_add_card/src/network/models/token_create_request_data.dart';
import 'package:payu_add_card/src/network/models/token_create_request_data_card.dart';

void main() {
  group('TokenCreateRequestData', () {
    group('`toJson`', () {
      test('should map model correctly', () {
        const model = TokenCreateRequestData(
          agreement: true,
          card: TokenCreateRequestDataCard(
            number: '5434021016824014',
            expirationMonth: '12',
            expirationYear: '29',
            cvv: '123',
          ),
        );

        final json = model.toJson();
        final card = json['card'] as TokenCreateRequestDataCard;

        expect(json['agreement'], equals(model.agreement));

        expect(card.number, equals(model.card.number));
        expect(card.expirationMonth, equals(model.card.expirationMonth));
        expect(card.expirationYear, equals(model.card.expirationYear));
        expect(card.cvv, equals(model.card.cvv));
      });
    });
  });
}
