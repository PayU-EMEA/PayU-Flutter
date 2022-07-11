import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/ios/request/apple_pay_summary_item.dart';

void main() {
  group('ApplePaySummaryItem', () {
    group('`toJson`', () {
      test('should map model correctly', () {
        const model = ApplePaySummaryItem(
          label: 'MLVCUVKEPH',
          amount: 4711528250,
        );

        final json = model.toJson();
        expect(json['label'], equals('MLVCUVKEPH'));
        expect(json['amount'], equals(4711528250));
      });
    });
  });
}
