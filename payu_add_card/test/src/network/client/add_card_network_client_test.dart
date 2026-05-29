import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:payu_api/payu_api.dart';
import 'package:payu_core/payu_core.dart';

import 'package:payu_add_card/src/network/client/add_card_network_client.dart';
import 'package:payu_add_card/src/network/models/token_create_request_data_card.dart';
import 'package:payu_add_card/src/network/models/token_create_result.dart';
import '../../../resources/resource_reader.dart';
import 'add_card_network_client_test.mocks.dart';

@GenerateMocks([SecureHttpClient])
void main() {
  late MockSecureHttpClient client;
  late AddCardNetworkClient sut;
  late TokenCreateRequestDataCard card;

  setUp(() {
    client = MockSecureHttpClient();
    sut = AddCardNetworkClient(client);

    card = const TokenCreateRequestDataCard(
      number: '4444 3333 2222 111',
      expirationMonth: '12',
      expirationYear: '29',
      cvv: '123',
    );
  });

  group('NetworkClient', () {
    test('when `environment` is not set then should throw exception', () async {
      expect(sut.tokenize(card, true), throwsException);
    });

    test('when `pos` is not set then should throw exception', () async {
      Payu.environment = Environment.sandbox;
      expect(sut.tokenize(card, true), throwsException);
    });

    group('`tokenize`', () {
      setUp(() {
        Payu.environment = Environment.sandbox;
        Payu.pos = const POS(id: 'id');
      });

      test('when request complete with success status then should return `TokenCreateResult`', () async {
        final data = resource('network_client_response_success.json');
        when(client.post(any, headers: anyNamed('headers'), body: anyNamed('body')))
            .thenAnswer((e) async => http.Response(jsonEncode(data), 200));

        expect(await sut.tokenize(card, true), isA<TokenCreateResult>());
      });

      test('when post returns non-200 status then should throw exception', () async {
        when(client.post(any, headers: anyNamed('headers'), body: anyNamed('body')))
            .thenAnswer((e) async => http.Response("", 500));

        expect(sut.tokenize(card, true), throwsA(isA<Exception>()));
      });

      test('when `save` is true then should call `/api/front/tokens` with JSON body and `MULTI` type', () async {
        final data = resource('network_client_response_success.json');
        when(client.post(any, headers: anyNamed('headers'), body: anyNamed('body')))
            .thenAnswer((e) async => http.Response(jsonEncode(data), 200));

        await sut.tokenize(card, true);

        final verification = verify(client.post(captureAny, headers: captureAnyNamed('headers'), body: captureAnyNamed('body')));
        final captured = verification.captured;
        final uri = captured[0] as Uri;
        final headers = captured[1] as Map<String, String>;
        final body = jsonDecode(captured[2] as String) as Map<String, dynamic>;
        final bodyCard = body['card'] as Map<String, dynamic>;

        expect(uri.path, '/api/front/tokens');
        expect(uri.queryParameters['from'], 'mobilesdk');
        expect(uri.queryParameters['sender'], 'flutter');
        expect(uri.queryParameters['version'], payuSdkVersion);
        expect(headers['Content-Type'], 'application/json');
        expect(body['posId'], 'id');
        expect(body['type'], 'MULTI');
        expect(bodyCard, {
          'number': card.number,
          'expirationMonth': card.expirationMonth,
          'expirationYear': card.expirationYear,
          'cvv': card.cvv,
        });
      });

      test('when `save` is false then should set `SINGLE_LONGTERM` token type', () async {
        final data = resource('network_client_response_success.json');
        when(client.post(any, headers: anyNamed('headers'), body: anyNamed('body')))
            .thenAnswer((e) async => http.Response(jsonEncode(data), 200));

        await sut.tokenize(card, false);

        final verification = verify(client.post(captureAny, headers: captureAnyNamed('headers'), body: captureAnyNamed('body')));
        final captured = verification.captured;
        final body = jsonDecode(captured[2] as String) as Map<String, dynamic>;

        expect(body['type'], 'SINGLE_LONGTERM');
      });
    });
  });
}
