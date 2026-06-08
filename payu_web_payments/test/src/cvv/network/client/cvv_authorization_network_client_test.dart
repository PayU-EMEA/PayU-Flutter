import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:payu_api/src/client/secure_http_client.dart';
import 'package:payu_core/payu_core.dart';

import 'package:payu_web_payments/src/cvv/network/client/cvv_authorization_network_client.dart';
import 'cvv_authorization_network_client_test.mocks.dart';

@GenerateMocks([SecureHttpClient])
void main() {
  late MockSecureHttpClient client;
  late CVVAuthorizationNetworkClient sut;

  setUp(() {
    client = MockSecureHttpClient();
    sut = CVVAuthorizationNetworkClient(client);
  });

  group('CVVAuthorizationNetworkClient', () {
    test('when `environment` is not set then should throw exception', () async {
      expect(sut.authorizeCVV(refReqId: 'refReqId', cvv: 'cvv'), throwsException);
    });

    test('when `pos` is not set then should throw exception', () async {
      Payu.environment = Environment.sandbox;
      expect(sut.authorizeCVV(refReqId: 'refReqId', cvv: 'cvv'), throwsException);
    });

    group('`authorizeCVV`', () {
      setUp(() {
        Payu.environment = Environment.sandbox;
        Payu.pos = const POS(id: 'id');
      });

      test('when request returns 202 then should complete successfully', () async {
        when(client.post(any, headers: anyNamed('headers'), body: anyNamed('body')))
            .thenAnswer((e) async => http.Response('', 202));

        await sut.authorizeCVV(refReqId: 'refReqId', cvv: '123');

        final verification = verify(client.post(captureAny, headers: captureAnyNamed('headers'), body: captureAnyNamed('body')));
        final captured = verification.captured;
        final uri = captured[0] as Uri;
        final headers = captured[1] as Map<String, String>;
        final body = captured[2] as String;

        expect(uri.path, '/api/front/card-authorizations/refReqId/cvv');
        expect(headers['Content-Type'], 'text/plain');
        expect(body, '123');
      });

      test('when request returns non-200 then should throw exception', () async {
        when(client.post(any, headers: anyNamed('headers'), body: anyNamed('body')))
            .thenAnswer((e) async => http.Response('', 400));

        expect(sut.authorizeCVV(refReqId: 'refReqId', cvv: '123'), throwsA(isA<Exception>()));
      });
    });
  });
}
