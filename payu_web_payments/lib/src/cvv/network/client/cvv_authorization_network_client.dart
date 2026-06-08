import 'package:payu_api/payu_api.dart';
import 'package:payu_core/payu_core.dart';

class CVVAuthorizationNetworkClient {
  final SecureHttpClient _client;

  CVVAuthorizationNetworkClient(this._client);

  Future<void> authorizeCVV({required String refReqId, required String cvv}) async {
    if (Payu.environment == null) throw NetworkClientException.missingEnvironment();
    if (Payu.pos == null) throw NetworkClientException.missingPOS();

    const headers = {'Content-Type': 'text/plain'};

    final configuration = NetworkClientConfiguration.environment(Payu.environment!);
    final url = Uri.parse('${configuration.baseUrl}/api/front/card-authorizations/$refReqId/cvv');
    final body = cvv;

    try {
      final response = await _client.post(url, headers: headers, body: body);
      if (response.statusCode != 202) {
        throw Exception('CVV authorization failed');
      }
    } catch (e) {
      rethrow;
    }
  }
}
