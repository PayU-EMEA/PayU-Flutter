import 'package:flutter_test/flutter_test.dart';

import 'package:payu_add_card/src/network/models/token_create_result.dart';
import '../../../resources/resource_reader.dart';

void main() {
  group('TokenCreateResult', () {
    group('`fromJson`', () {
      test('when `json` is correct then should map model correctly', () {
        final json = resource('token_create_result_test.json');
        final model = TokenCreateResult.fromJson(json);

        expect(model.token, equals('TOK_1KLPUR7NNONX0pmWlmL8g8kYhzs6'));
        expect(model.mask, equals('444433******1111'));
        expect(model.type, equals('STANDARD'));
      });
    });
  });
}
