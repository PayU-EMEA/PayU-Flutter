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

      test('when post complete with failure status then should throw `NetworkClientError`', () async {
        final data = resource('network_client_response_failure.json');
        when(client.post(any, headers: anyNamed('headers'), body: anyNamed('body')))
            .thenAnswer((e) async => http.Response(jsonEncode(data), 200));

        expect(sut.tokenize(card, true), throwsA(isA<NetworkClientError>()));
      });
    });
  });
}
