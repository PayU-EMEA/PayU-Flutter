import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/core/constants.dart';
import 'package:example/core/ui/snackbar.dart';

class DemoWebPaymentsSecureController extends GetxController {
  final items = [
    'https://expired.badssl.com/',
    'https://wrong.host.badssl.com/',
    'https://self-signed.badssl.com/',
    'https://untrusted-root.badssl.com/',
    'https://revoked.badssl.com/',
    'https://pinning-test.badssl.com/',
    'https://some-unknown-domain.hello.world/',
  ];

  void didTapItem(int index) async {
    final result = await Get.to<WebPaymentsResult>(
      () => WebPaymentsPage(
        request: WebPaymentsRequest(
          type: WebPaymentsRequestType.payByLink,
          redirectUri: items[index],
          continueUri: Constants.continueUrl,
        ),
      ),
    );
    if (result != null) snackbar(result.toString());
  }
}
