import 'dart:convert';

import 'package:payu_api/payu_api.dart';
import 'package:payu_core/payu_core.dart';

import '../finders/payment_card_provider_finder.dart';
import '../helpers/card_luhn_validator.dart';
import '../models/payment_card.dart';
import '../models/test_payment_card.dart';
import '../network/client/add_card_network_client.dart';
import '../network/models/token_create_request_data_card.dart';
import '../network/models/token_create_result.dart';
import '../resources/test_paymant_card_source.dart';

class TestCardsService {
  final AddCardNetworkClient _client;
  final PaymentCardProviderFinder _finder;

  TestCardsService(this._client, this._finder);

  factory TestCardsService.create() {
    final httpClient = SecureHttpClient.create();
    final client = AddCardNetworkClient(httpClient);
    final validator = CardLuhnValidator();
    final provider = PaymentCardProviderFinder(validator);
    return TestCardsService(client, provider);
  }

  Future<List<TestPaymentCard>> getTestPaymentCards() async {
    return (jsonDecode(testPaymentCardsJson) as List).map((e) => TestPaymentCard.fromJson(e)).toList();
  }

  Future<CardToken> tokenizeTestPaymentCard(TestPaymentCard value) async {
    final card = PaymentCard.fromTestPaymentCard(value);
    final data = TokenCreateRequestDataCard.fromPaymentCard(card);
    final result = await _client.tokenize(data, false);
    return _mapTokenCreateResult(card, result);
  }

  CardToken _mapTokenCreateResult(PaymentCard card, TokenCreateResult result) {
    final provider = _finder.find(card.number);

    return CardToken(
      brandImageUrl: provider?.brandImageProvider.light ?? '',
      cardExpirationMonth: card.expirationMonth,
      cardExpirationYear: card.expirationYear,
      cardNumberMasked: result.mask,
      cardScheme: provider?.scheme,
      preferred: false,
      status: CardTokenStatus.active,
      value: result.token,
    );
  }
}
