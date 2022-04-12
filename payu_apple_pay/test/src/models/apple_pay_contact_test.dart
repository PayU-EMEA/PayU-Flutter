import 'package:flutter_test/flutter_test.dart';

import 'package:payu_apple_pay/src/models/apple_pay_contact.dart';

void main() {
  group('ApplePayContact', () {
    group('`toJson`', () {
      test('should map model correctly', () {
        const model = ApplePayContact(emailAddress: 'email@address.com');
        final json = model.toJson();

        expect(json['emailAddress'], equals(model.emailAddress));
      });
    });
  });
}
