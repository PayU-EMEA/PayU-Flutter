import 'package:flutter/material.dart';
import 'package:payu_state_management/payu_state_management.dart';
import 'package:payu_translations/payu_translations.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'helpers/soft_accept_constants.dart';
import 'models/soft_accept_request.dart';
import 'soft_accept_assembler.dart';
import 'soft_accept_controller.dart';

class SoftAcceptAlertDialog extends StatelessWidget {
  final SoftAcceptRequest request;

  const SoftAcceptAlertDialog({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return PayuWidget<SoftAcceptController, SoftAcceptAssembler>(
      assembler: () => SoftAcceptAssembler(request),
      builder: (context, controller) {
        final webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(Colors.yellowAccent)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageFinished: (url) => controller.didCompleteProcessingPage(),
            ),
          )
          ..addJavaScriptChannel(
            SoftAcceptConstants.javascriptChannelName,
            onMessageReceived: (message) async {
              final result = await controller.handleJavascriptMessage(message.message);
              if (result != null && context.mounted) {
                Navigator.of(context).pop(result);
              }
            },
          )
          ..loadRequest(Uri.dataFromString(controller.iframe, mimeType: 'text/html'));

        controller.didCreateWebViewController(webViewController);

        return AlertDialog(
          title: Text('payment_security'.translated()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('please_wait_for_this_window_to_close_automatically'.translated()),
              SizedBox(
                height: 24.0,
                width: 24.0,
                child: Opacity(
                  opacity: double.minPositive,
                  child: WebViewWidget(controller: webViewController),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
