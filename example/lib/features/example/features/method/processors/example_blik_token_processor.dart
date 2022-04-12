import 'package:payu/payu.dart';

import 'package:example/data/models/pay_method.dart';
import 'package:example/data/models/pay_method_type.dart';

class ExampleBlikTokenProcessor {
  void process({required BlikToken blikToken, required Function(PayMethod) onProcessed}) async {
    onProcessed(PayMethod(type: PayMethodType.blikToken, value: blikToken.value));
  }
}
