import 'dart:convert';

import 'package:payu_api/payu_api.dart';
import 'package:payu_core/payu_core.dart';

import '../models/token_create_request.dart';
import '../models/token_create_request_data_card.dart';
import '../models/token_create_result.dart';

class AddCardNetworkClient {
  final SecureHttpClient _client;

  AddCardNetworkClient(this._client);

  Future<TokenCreateResult> tokenize(TokenCreateRequestDataCard card, bool save) async {
    if (Payu.environment == null) throw NetworkClientException.missingEnvironment();
    if (Payu.pos == null) throw NetworkClientException.missingPOS();

    const headers = {'Content-Type': 'application/json'};

    final configuration = NetworkClientConfiguration.environment(Payu.environment!);
    final url = Uri.parse('${configuration.baseUrl}/api/front/tokens').replace(
      queryParameters: {
        'from': 'mobilesdk',
        'sender': 'flutter',
        'version': payuSdkVersion,
      },
    );
    final request = TokenCreateRequest(
      posId: Payu.pos!.id,
      save: save,
      card: card,
    );
    final body = jsonEncode(request);

    try {
      final response = await _client.post(url, headers: headers, body: body);
      if (response.statusCode != 200) {
        throw Exception('Token create request failed');
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;

      return TokenCreateResult.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
