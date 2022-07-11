import 'dart:convert';

import 'package:payu_api/payu_api.dart';
import 'package:payu_core/payu_core.dart';

import '../models/soft_accept_log.dart';

class SoftAcceptNetworkClient {
  final SecureHttpClient _client;

  SoftAcceptNetworkClient(this._client);

  Future<bool> postSoftAcceptLog(SoftAcceptLog log) async {
    const headers = {'Content-Type': 'application/vnd.payu+json'};
    final configuration = NetworkClientConfiguration.environment(Payu.environment!);
    final url = Uri.parse('${configuration.baseUrl}/front/logger');
    final body = jsonEncode(log);

    final response = await _client.post(url, headers: headers, body: body);
    return response.statusCode == 200;
  }
}
