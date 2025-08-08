import 'package:flutter/material.dart';

import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';
import 'package:payu_translations/payu_translations.dart';
import 'package:payu_ui/payu_ui.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../payu_web_payments.dart';
import 'web_payments_assembler.dart';
import 'web_payments_controller.dart';

class WebPaymentsPage extends StatefulWidget {
  final WebPaymentsRequest request;

  const WebPaymentsPage({super.key, required this.request});

  @override
  State<WebPaymentsPage> createState() => _WebPaymentsPageState();
}

class _WebPaymentsPageState extends State<WebPaymentsPage> with WebPaymentsControllerDelegate {
  late final assembler = WebPaymentsAssembler(this, widget.request);
  late final controller = assembler.find<WebPaymentsController>();

  @override
  Widget build(BuildContext context) {
    return PayuWidget<WebPaymentsController, WebPaymentsAssembler>(
      assembler: () => assembler,
      builder: (context, controller) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: PayuImage.logo(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(44),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PayuPadding.padding8,
                vertical: PayuPadding.padding8,
              ),
              child: Row(
                children: [
                  Icon(
                    PayuIcon.lock,
                    color: controller.isSecureUri ? PayuColors.primary2 : PayuColors.tertiary2,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: PayuPadding.padding8),
                      child: Text(controller.uri.toString(), maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                  )
                ],
              ),
            ),
          ),
          leading: PayuAppBarIcon.back(
            onPressed: () => controller.didTapBackButton(),
          ),
        ),
        body: WebView(
          onWebViewCreated: (webViewController) => controller.didUpdateWebViewController(webViewController),
          onWebResourceError: (error) => controller.didUpdateWebResourceError(error),
          initialUrl: controller.initialUri,
          navigationDelegate: (request) => controller.navigationDecision(request.url),
          onPageStarted: (uri) => controller.didStartNavigation(uri),
          onPageFinished: (uri) => controller.didFinishNavigation(uri),
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
        ),
      ),
    );
  }

  // WebPaymentsControllerDelegate

  @override
  void showBackAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => Theme(
        data: Payu.theme,
        child: AlertDialog(
          title: Text('close_and_go_back'.translated()),
          content: Text('your_payment_will_be_canceled_continue'.translated()),
          actions: [
            TextButton(
              child: Text('yes_go_back'.translated()),
              onPressed: () {
                Navigator.of(context).pop();
                controller.didConfirmCancelPayment();
              },
            ),
            TextButton(
              child: Text('no_stay_on_one_payment_page'.translated()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void showWebResourceErrorAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => Theme(
        data: Payu.theme,
        child: AlertDialog(
          title: Text('your_connection_is_not_secure'.translated()),
          content: Text(
              'attackers_might_be_trying_to_steal_your_information_for_example_passwords_messages_or_credit_cards'
                  .translated()),
          actions: [
            TextButton(
              child: Text('cancel'.translated()),
              onPressed: () {
                Navigator.of(context).pop();
                controller.didConfirmWebResourceError();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void showWebPaymentsViewModelShouldPresentProviderRedirectDialog(String uri) {
    showDialog(
      context: context,
      builder: (context) => Theme(
        data: Payu.theme,
        child: AlertDialog(
          title: Text('credit_provider_url_redirect'.translated()),
          content: Text('credit_browser_provider_url_redirect'.translated()),
          actions: [
            TextButton(
              child: Text('ok'.translated()),
              onPressed: () {
                Navigator.of(context).pop();
                controller.didProceedWithCreditExternalApplication(uri);
              },
            ),
            TextButton(
              child: Text('cancel'.translated(), style: const TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
                controller.didAbortCreditExternalApplication();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didComplete(WebPaymentsResult result) {
    Navigator.of(context).pop(result);
  }
}
