import 'package:flutter_test/flutter_test.dart';

import 'package:payu_core/payu_core.dart';

void main() {
  test('`Payu.environment` should be null by default', () {
    expect(Payu.environment, equals(null));
  });

  test('`Payu.environment` should set correctly', () {
    Payu.environment = Environment.production;
    expect(Payu.environment, equals(Environment.production));
  });
}
