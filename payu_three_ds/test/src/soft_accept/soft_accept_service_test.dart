import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:payu_three_ds/payu_three_ds.dart';
import 'package:payu_three_ds/src/soft_accept/helpers/soft_accept_query_parameter_extractor.dart';
import 'package:payu_three_ds/src/soft_accept/network/client/soft_accept_network_client.dart';
import 'package:payu_three_ds/src/soft_accept/network/models/soft_accept_log.dart';
import 'package:payu_three_ds/src/soft_accept/soft_accept_service.dart';
import 'soft_accept_service_test.mocks.dart';

@GenerateMocks([
  SoftAcceptNetworkClient,
  SoftAcceptQueryParameterExtractor,
])
void main() {
  late MockSoftAcceptNetworkClient client;
  late MockSoftAcceptQueryParameterExtractor extractor;
  late SoftAcceptService sut;

  const javascriptMessage = '{"data": "DISPLAY_FRAME"}';
  const redirectUri = 'redirectUri';

  setUp(() {
    client = MockSoftAcceptNetworkClient();
    extractor = MockSoftAcceptQueryParameterExtractor();
    sut = SoftAcceptService(client, extractor);
  });

  group('`postSoftAcceptLog`', () {
    test('when `redirectUri` does not contain `authenticationId` then should return `null`', () async {
      when(extractor.extractAuthenticationId(any)).thenReturn(null);

      final result = await sut.postSoftAcceptLog(javascriptMessage, redirectUri);
      verify(extractor.extractAuthenticationId(redirectUri));
      expect(result, equals(null));
    });

    group('when `redirectUri` contains `authenticationId`', () {
      test('then should extract `authenticationId` via extractor', () async {
        when(extractor.extractAuthenticationId(any)).thenReturn('authenticationId');
        when(client.postSoftAcceptLog(any)).thenAnswer((a) async => true);

        await sut.postSoftAcceptLog(javascriptMessage, redirectUri);
        verify(extractor.extractAuthenticationId(redirectUri));
      });

      test('then should log `log` via client', () async {
        when(extractor.extractAuthenticationId(any)).thenReturn('authenticationId');
        when(client.postSoftAcceptLog(any)).thenAnswer((a) async => true);

        final log = SoftAcceptLog(message: 'DISPLAY_FRAME', id: extractor.extractAuthenticationId(redirectUri)!);

        await sut.postSoftAcceptLog(javascriptMessage, redirectUri);
        verify(client.postSoftAcceptLog(log));
      });

      test('when `client` completes with success when should return expected `SoftAcceptMessage`', () async {
        when(extractor.extractAuthenticationId(any)).thenReturn('authenticationId');
        when(client.postSoftAcceptLog(any)).thenAnswer((a) async => true);

        final result = SoftAcceptMessageFromExt.fromValue('DISPLAY_FRAME');
        expect(await sut.postSoftAcceptLog(javascriptMessage, redirectUri), equals(result));
      });

      test('when `client` completes with failure when should return `null`', () async {
        when(extractor.extractAuthenticationId(any)).thenReturn('authenticationId');
        when(client.postSoftAcceptLog(any)).thenThrow(Exception());

        expect(await sut.postSoftAcceptLog(javascriptMessage, redirectUri), equals(null));
      });
    });
  });
}



  // Future<SoftAcceptMessage?> postSoftAcceptLog({required String javascriptMessage, required String redirectUri}) async {
  //   final result = SoftAcceptResult.fromJson(jsonDecode(javascriptMessage));
  //   final id = _extractor.extractAuthenticationId(redirectUri);
  //   if (id == null) return null;

  //   try {
  //     final message = result.message.value;
  //     final log = SoftAcceptLog(message: message, id: id);
  //     _client.postSoftAcceptLog(log: log);
  //     return result.message;
  //   } catch (e) {
  //     return null;
  //   }
  // }
