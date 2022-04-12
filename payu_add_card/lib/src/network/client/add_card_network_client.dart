import 'dart:convert';

import 'package:payu_api/payu_api.dart';
import 'package:payu_core/payu_core.dart';

import '../models/token_create_request.dart';
import '../models/token_create_request_data.dart';
import '../models/token_create_request_data_card.dart';
import '../models/token_create_response.dart';
import '../models/token_create_result.dart';

class AddCardNetworkClient {
  final SecureHttpClient _client;

  AddCardNetworkClient(this._client);

  Future<TokenCreateResult> tokenize(TokenCreateRequestDataCard card, bool save) async {
    if (Payu.environment == null) throw NetworkClientException.missingEnvironment();
    if (Payu.pos == null) throw NetworkClientException.missingPOS();

    const headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    final configuration = NetworkClientConfiguration.environment(Payu.environment!);
    final url = Uri.parse('${configuration.baseUrl}/api/v2/token/token.json');
    final data = TokenCreateRequestData(agreement: save, card: card);
    final request = TokenCreateRequest(sender: Payu.pos!.id, data: data);
    final body = 'data=${jsonEncode(request)}';

    try {
      final response = await _client.post(url, headers: headers, body: body);
      final result = TokenCreateResponse.fromJson(jsonDecode(response.body));
      final data = result.data;

      return data != null
          ? TokenCreateResult(token: data.token, mask: data.mask, type: data.type)
          : throw NetworkClientError.fromStatus(result.status);
    } catch (e) {
      rethrow;
    }
  }
}
