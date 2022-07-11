import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/data/models/pay_method.dart';
import 'package:example/data/models/pay_method_type.dart';
import 'package:example/features/example/features/method/blik/example_blik_alert_dialog.dart';

class ExampleBlikCodeProcessor {
  void process({required BlikCode blikCode, required Function(PayMethod) onProcessed}) async {
    final code = await Get.dialog<String>(ExampleBlikAlertDialog());
    onProcessed(PayMethod(type: PayMethodType.blikToken, authorizationCode: code));
  }
}
