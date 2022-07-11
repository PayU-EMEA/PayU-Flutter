import 'package:payu/payu.dart';

import 'package:example/data/models/pay_method.dart';
import 'package:example/data/models/pay_method_type.dart';

class ExampleCardTokenProcessor {
  void process({required CardToken cardToken, required Function(PayMethod) onProcessed}) async {
    onProcessed(PayMethod(type: PayMethodType.cardToken, value: cardToken.value));
  }
}
