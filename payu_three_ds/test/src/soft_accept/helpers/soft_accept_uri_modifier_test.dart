import 'package:flutter_test/flutter_test.dart';

import 'package:payu_three_ds/src/soft_accept/helpers/soft_accept_uri_modifier.dart';

void main() {
  group('`SoftAcceptUriModifier`', () {
    late SoftAcceptUriModifier sut;

    setUp(() {
      sut = SoftAcceptUriModifier();
    });

    group('`modify`', () {
      test('when called then should add `sendCreq` parameter', () {
        expect(sut.modify('www.example.com?param=value').queryParameters['sendCreq'], equals('false'));
        expect(sut.modify('www.example.com').queryParameters['sendCreq'], equals('false'));
      });
    });
  });
}
