import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'helpers/soft_accept_components.dart';
import 'helpers/soft_accept_configuration.dart';
import 'helpers/soft_accept_uri_modifier.dart';
import 'models/soft_accept_message.dart';
import 'models/soft_accept_request.dart';
import 'soft_accept_service.dart';

class SoftAcceptController extends PayuController {
  final SoftAcceptRequest _request;

  final SoftAcceptComponents _components;
  final SoftAcceptService _service;
  final SoftAcceptUriModifier _modifier;

  late String redirectUri = _modifier.modify(_request.redirectUri).toString();
  late String iframe = _components.iframe(redirectUri);
  late WebViewController webViewController;

  SoftAcceptController(this._request, this._components, this._service, this._modifier);

  void didCreateWebViewController(WebViewController controller) {
    webViewController = controller;
  }

  void didCompleteProcessingPage() async {
    final configuration = SoftAcceptConfiguration.environment(Payu.environment!);
    final javaScript = _components.javascript(configuration.origin, configuration.channelName);
    webViewController.runJavaScript(javaScript);
  }

  Future<SoftAcceptMessage?> handleJavascriptMessage(String javascriptMessage) {
    return _service.postSoftAcceptLog(javascriptMessage, redirectUri);
  }
}
