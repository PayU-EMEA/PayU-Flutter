import 'package:flutter_test/flutter_test.dart';

import 'package:payu_core/src/extensions/string_ext.dart';

void main() {
  test('`digistOnly` should format string correctly', () {
    expect('actual'.digitsOnly, equals(''));
    expect('bXjDmX2SXJ'.digitsOnly, equals('2'));
    expect('3H0iKxASKO'.digitsOnly, equals('30'));
    expect('12/2024'.digitsOnly, equals('122024'));
    expect('4444 3333 2222 1111'.digitsOnly, equals('4444333322221111'));
  });
}
