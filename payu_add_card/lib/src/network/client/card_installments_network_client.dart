import 'dart:convert';

import 'package:payu_api/payu_api.dart';
import 'package:payu_core/payu_core.dart';

import '../models/card_installments_request.dart';
import '../models/card_installments_response.dart';

class CardInstallmentsNetworkClient {
  final SecureHttpClient _client;

  CardInstallmentsNetworkClient(this._client);

  Future<CardInstallmentsResponse> options(String cardBin) async {
    if (Payu.environment == null) throw NetworkClientException.missingEnvironment();
    if (Payu.pos == null) throw NetworkClientException.missingPOS();

    const headers = {'Content-Type': 'application/json'};

    final configuration = NetworkClientConfiguration.environment(Payu.environment!);
    final url = Uri.parse('${configuration.baseUrl}/api/front/card-installments-options');
    final request = CardInstallmentsRequest(
      cardBin: cardBin,
      internalPosId: Payu.pos!.id,
    );
    final body = jsonEncode(request);

    try {
      final response = await _client.post(url, headers: headers, body: body);
      if (response.statusCode != 200) {
        throw Exception('Card installments options request failed');
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;

      return CardInstallmentsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}

