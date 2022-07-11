import 'package:payu/payu.dart';

import 'package:example/data/models/pay_method.dart';
import 'package:example/data/models/pay_method_type.dart';

class ExamplePayByLinkProcessor {
  void process({required PayByLink payByLink, required Function(PayMethod) onProcessed}) async {
    onProcessed(PayMethod(type: PayMethodType.pbl, value: payByLink.value));
  }
}
