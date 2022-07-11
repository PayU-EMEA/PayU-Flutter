import 'package:flutter_test/flutter_test.dart';

import 'package:payu_web_payments/src/cvv/network/models/cvv_authorization_data.dart';

void main() {
  group('CVVAuthorizationData', () {
    group('`toJson`', () {
      test('should map model correctly', () {
        const model = CVVAuthorizationData(
          refReqId: '5434021016824014',
          cvv: '123',
        );
        final json = model.toJson();

        expect(json['refReqId'], equals(model.refReqId));
        expect(json['cvv'], equals(model.cvv));
      });
    });
  });
}
