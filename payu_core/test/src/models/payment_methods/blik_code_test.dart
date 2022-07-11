import 'package:flutter_test/flutter_test.dart';

import 'package:payu_core/src/models/payment_methods/blik_code.dart';

void main() {
  group('BlikCode', () {
    test('should have model correct properties', () {
      const model = BlikCode();

      expect(model.description, equals(null));
      expect(model.enabled, equals(true));
      expect(model.hash, equals('blik_code'));
      expect(model.name, equals('BLIK'));
    });
  });
}
