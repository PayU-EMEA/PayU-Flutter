import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/ios/request/apple_pay_contact.dart';

void main() {
  group('ApplePayContact', () {
    group('`toJson`', () {
      test('should map model correctly', () {
        const model = ApplePayContact(
          emailAddress: 'YOEHZBRKDW@address.com',
        );

        final json = model.toJson();
        expect(json['emailAddress'], equals('YOEHZBRKDW@address.com'));
      });
    });
  });
}
