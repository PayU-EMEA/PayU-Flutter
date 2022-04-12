import 'package:flutter_test/flutter_test.dart';

import 'package:payu_apple_pay/src/models/apple_pay_summary_item.dart';

void main() {
  group('ApplePaySummaryItem', () {
    group('`toJson`', () {
      test('should map model correctly', () {
        const model = ApplePaySummaryItem(label: 'label', amount: 25);
        final json = model.toJson();

        expect(json['label'], equals(model.label));
        expect(json['amount'], equals(model.amount));
      });
    });
  });
}
