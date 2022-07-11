import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/core/ui/snackbar.dart';

class DemoAddCardPageController extends GetxController {
  void demo() async {
    final cardToken = await Get.to<CardToken>(() => const AddCardPage());
    if (cardToken is CardToken) snackbar('cardToken: $cardToken');
  }
}
