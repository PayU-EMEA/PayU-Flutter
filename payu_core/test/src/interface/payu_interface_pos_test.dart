import 'package:flutter_test/flutter_test.dart';

import 'package:payu_core/payu_core.dart';

void main() {
  test('`Payu.pos` should be null by default', () {
    expect(Payu.pos, equals(null));
  });

  test('`Payu.pos` should set correctly', () {
    const id = 'pos';
    Payu.pos = const POS(id: id);
    expect(Payu.pos?.id, equals(id));
  });
}
