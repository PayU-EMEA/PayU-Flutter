import 'package:flutter/material.dart';

import 'package:payu_api/payu_api.dart';
import 'package:payu_state_management/payu_state_management.dart';

import 'network/client/cvv_authorization_network_client.dart';

class CVVAuthorizationController extends PayuController {
  final String _refReqId;
  final CVVAuthorizationNetworkClient _client;

  bool get isEnabled => textEditingController.text.length == 3 && codeLiteral == null;
  String? get codeLiteral => _codeLiteral;

  final textEditingController = TextEditingController();
  String? _codeLiteral;

  CVVAuthorizationController(this._refReqId, this._client);

  @override
  void onInit() {
    textEditingController.addListener(() => _setCodeLiteral(null));
    super.onInit();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  Future<void> didTapConfirmButton() async {
    try {
      _setCodeLiteral(null);
      final result = await _client.authorizeCVV(refReqId: _refReqId, cvv: textEditingController.text);
      if (result.status.statusCode != NetworkClientStatusCode.success) throw result.status;
    } on NetworkClientStatus catch (status) {
      _setCodeLiteral(status.codeLiteral);
      rethrow;
    } catch (e) {
      _setCodeLiteral(e.toString());
      rethrow;
    }
  }

  void _setCodeLiteral(String? value) {
    _codeLiteral = value;
    notifyListeners();
  }
}
