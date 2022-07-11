import 'package:flutter_test/flutter_test.dart';
import 'package:payu_api/payu_api.dart';

import 'package:payu_web_payments/src/cvv/cvv_authorization_assembler.dart';
import 'package:payu_web_payments/src/cvv/cvv_authorization_controller.dart';
import 'package:payu_web_payments/src/cvv/network/client/cvv_authorization_network_client.dart';

void main() {
  late CVVAuthorizationAssembler sut;

  setUp(() {
    sut = CVVAuthorizationAssembler('refReqId');
  });

  group('CVVAuthorizationAssembler', () {
    group('`assemble`', () {
      test('when called then expected dependencies are registered', () {
        sut.assemble();
        expect(sut.find<SecureHttpClient>(), isA<SecureHttpClient>());
        expect(sut.find<CVVAuthorizationNetworkClient>(), isA<CVVAuthorizationNetworkClient>());
        expect(sut.find<CVVAuthorizationController>(), isA<CVVAuthorizationController>());
      });
    });
  });
}
