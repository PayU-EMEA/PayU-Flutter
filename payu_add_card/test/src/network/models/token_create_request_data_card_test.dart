import 'package:flutter_test/flutter_test.dart';

import 'package:payu_add_card/src/network/models/token_create_request_data_card.dart';

void main() {
  group('TokenCreateRequestDataCard', () {
    group('`toJson`', () {
      test('should map model correctly', () {
        const model = TokenCreateRequestDataCard(
          number: '5434021016824014',
          expirationMonth: '12',
          expirationYear: '29',
          cvv: '123',
        );
        final json = model.toJson();

        expect(json['number'], equals(model.number));
        expect(json['expirationMonth'], equals(model.expirationMonth));
        expect(json['expirationYear'], equals(model.expirationYear));
        expect(json['cvv'], equals(model.cvv));
      });
    });
  });
}
