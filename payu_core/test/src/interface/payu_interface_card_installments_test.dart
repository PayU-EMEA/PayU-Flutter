import 'package:flutter_test/flutter_test.dart';

import 'package:payu_core/payu_core.dart';

void main() {
  group('PayuInterfaceCardInstallments', () {
    test('should store and expose cardInstallments flag globally', () {
      Payu.cardInstallments = false;
      expect(Payu.cardInstallments, isFalse);

      Payu.cardInstallments = true;
      expect(Payu.cardInstallments, isTrue);

      Payu.cardInstallments = false;
      expect(Payu.cardInstallments, isFalse);
    });
  });
}

