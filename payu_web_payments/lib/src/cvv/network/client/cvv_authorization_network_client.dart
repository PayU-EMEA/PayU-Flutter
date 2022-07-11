import 'dart:convert';

import 'package:payu_api/payu_api.dart';
import 'package:payu_core/payu_core.dart';

import '../models/cvv_authorization_data.dart';
import '../models/cvv_authorization_request.dart';
import '../models/cvv_authotization_response.dart';

class CVVAuthorizationNetworkClient {
  final SecureHttpClient _client;

  CVVAuthorizationNetworkClient(this._client);

  Future<CVVAuthorizationResponse> authorizeCVV({required String refReqId, required String cvv}) async {
    if (Payu.environment == null) throw NetworkClientException.missingEnvironment();
    if (Payu.pos == null) throw NetworkClientException.missingPOS();

    const headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    final configuration = NetworkClientConfiguration.environment(Payu.environment!);
    final url = Uri.parse('${configuration.baseUrl}/api/v2/token/token.json');
    final data = CVVAuthorizationData(refReqId: refReqId, cvv: cvv);
    final request = CVVAuthorizationRequest(data: data);
    final body = 'data=${jsonEncode(request)}';

    try {
      final response = await _client.post(url, headers: headers, body: body);
      return CVVAuthorizationResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
