import 'dart:convert';

import 'helpers/soft_accept_query_parameter_extractor.dart';
import 'models/soft_accept_message.dart';
import 'models/soft_accept_result.dart';
import 'network/client/soft_accept_network_client.dart';
import 'network/models/soft_accept_log.dart';

class SoftAcceptService {
  final SoftAcceptNetworkClient _client;
  final SoftAcceptQueryParameterExtractor _extractor;

  SoftAcceptService(this._client, this._extractor);

  Future<SoftAcceptMessage?> postSoftAcceptLog(String javascriptMessage, String redirectUri) async {
    final result = SoftAcceptResult.fromJson(jsonDecode(javascriptMessage));
    final id = _extractor.extractAuthenticationId(redirectUri);
    if (id == null) return null;

    try {
      final message = result.message.value;
      final log = SoftAcceptLog(message: message, id: id);
      _client.postSoftAcceptLog(log);
      return result.message;
    } catch (e) {
      return null;
    }
  }
}
