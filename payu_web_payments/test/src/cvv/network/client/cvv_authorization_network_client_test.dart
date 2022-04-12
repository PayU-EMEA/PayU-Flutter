import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:payu_api/src/client/secure_http_client.dart';
import 'package:payu_core/payu_core.dart';

import 'package:payu_web_payments/src/cvv/network/client/cvv_authorization_network_client.dart';
import 'package:payu_web_payments/src/cvv/network/models/cvv_authotization_response.dart';
import '../../../../resources/resource_reader.dart';
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

      test('when request complete with success status then should return `CVVAuthorizationResponse`', () async {
        final data = resource('cvv_authorization_response_success.json');
        when(client.post(any, headers: anyNamed('headers'), body: anyNamed('body')))
            .thenAnswer((e) async => http.Response(jsonEncode(data), 200));

        expect(await sut.authorizeCVV(refReqId: 'refReqId', cvv: 'cvv'), isA<CVVAuthorizationResponse>());
      });

      test('when post complete with failure status then should return `CVVAuthorizationResponse`', () async {
        final data = resource('cvv_authorization_response_failure.json');
        when(client.post(any, headers: anyNamed('headers'), body: anyNamed('body')))
            .thenAnswer((e) async => http.Response(jsonEncode(data), 200));

        expect(await sut.authorizeCVV(refReqId: 'refReqId', cvv: 'cvv'), isA<CVVAuthorizationResponse>());
      });
    });
  });
}
