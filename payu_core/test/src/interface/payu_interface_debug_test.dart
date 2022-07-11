import 'package:flutter_test/flutter_test.dart';

import 'package:payu_core/payu_core.dart';

void main() {
  test('`Payu.debug` should be false by default', () {
    expect(Payu.debug, equals(false));
  });

  test('`Payu.debug` should set correctly', () {
    Payu.debug = true;
    expect(Payu.debug, equals(true));
  });
}
