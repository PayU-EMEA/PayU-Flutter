import 'package:payu/payu.dart';

import 'package:example/data/models/pay_method.dart';
import 'package:example/data/models/pay_method_type.dart';

class ExampleInstallmentsProcessor {
  void process({required Installments installments, required Function(PayMethod) onProcessed}) async {
    onProcessed(PayMethod(type: PayMethodType.pbl, value: installments.value));
  }
}
