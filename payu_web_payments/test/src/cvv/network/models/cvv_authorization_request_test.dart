import 'package:flutter_test/flutter_test.dart';

import 'package:payu_web_payments/src/cvv/network/models/cvv_authorization_data.dart';
import 'package:payu_web_payments/src/cvv/network/models/cvv_authorization_request.dart';

void main() {
  group('CVVAuthorizationRequest', () {
    group('`toJson`', () {
      test('should map model correctly', () {
        const model = CVVAuthorizationRequest(
          data: CVVAuthorizationData(
            refReqId: '1234qwer',
            cvv: '067',
          ),
        );

        final json = model.toJson();
        final data = json['data'] as CVVAuthorizationData;

        expect(json['request'], equals('auth.cvv'));

        expect(data.refReqId, equals(model.data.refReqId));
        expect(data.cvv, equals(model.data.cvv));
      });
    });
  });
}
