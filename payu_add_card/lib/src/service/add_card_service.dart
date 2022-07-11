import 'package:payu_core/payu_core.dart';

import '../finders/payment_card_provider_finder.dart';
import '../models/payment_card.dart';
import '../network/client/add_card_network_client.dart';
import '../network/models/token_create_request_data_card.dart';
import '../network/models/token_create_result.dart';

mixin AddCardServiceDelegate {
  PaymentCard card();
  void validate();
}

class AddCardService {
  final AddCardNetworkClient _client;
  final PaymentCardProviderFinder _finder;

  late AddCardServiceDelegate delegate;

  AddCardService(this._client, this._finder);

  Future<CardToken> tokenize(bool save) async {
    try {
      delegate.validate();
      final card = delegate.card();
      final data = TokenCreateRequestDataCard.fromPaymentCard(card);
      final result = await _client.tokenize(data, save);
      return _mapTokenCreateResult(card, result);
    } catch (e) {
      rethrow;
    }
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
