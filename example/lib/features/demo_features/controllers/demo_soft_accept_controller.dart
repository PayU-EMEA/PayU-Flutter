import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/core/ui/snackbar.dart';

class DemoSoftAcceptController extends GetxController {
  void demo() async {
    final result = await Get.dialog<SoftAcceptMessage>(
      const SoftAcceptAlertDialog(
        request: SoftAcceptRequest(
          redirectUri:
              'https://merch-prod.snd.payu.com/front/threeds/?authenticationId=d467a9dc-f8c0-4371-8b5e-ba6f9eb4fa2d&refReqId=6fb8983e3eec7724d73683b835a9f444',
        ),
      ),
    );

    if (result != null) snackbar(result.toString());
  }
}
