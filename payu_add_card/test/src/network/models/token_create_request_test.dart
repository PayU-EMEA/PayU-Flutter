import 'package:flutter_test/flutter_test.dart';

import 'package:payu_add_card/src/network/models/token_create_request.dart';
import 'package:payu_add_card/src/network/models/token_create_request_data.dart';
import 'package:payu_add_card/src/network/models/token_create_request_data_card.dart';

void main() {
  group('TokenCreateRequest', () {
    group('`toJson`', () {
      test('should map model correctly', () {
        const model = TokenCreateRequest(
          sender: '0123456789',
          data: TokenCreateRequestData(
            agreement: true,
            card: TokenCreateRequestDataCard(
              number: '5434021016824014',
              expirationMonth: '12',
              expirationYear: '29',
              cvv: '123',
            ),
          ),
        );

        final json = model.toJson();
        final data = json['data'] as TokenCreateRequestData;

        expect(json['request'], equals('TokenCreateRequest'));
        expect(json['sender'], equals(model.sender));

        expect(data.agreement, equals(model.data.agreement));
        expect(data.card.number, equals(model.data.card.number));
        expect(data.card.expirationMonth, equals(model.data.card.expirationMonth));
        expect(data.card.expirationYear, equals(model.data.card.expirationYear));
        expect(data.card.cvv, equals(model.data.card.cvv));
      });
    });
  });
}
