import 'package:flutter_test/flutter_test.dart';

import 'package:payu_web_payments/payu_web_payments.dart';

void main() {
  late CVVAuthorizationExtractor sut;

  setUp(() {
    sut = CVVAuthorizationExtractor();
  });

  group('CVVAuthorizationExtractor', () {
    group('`extractRefReqId`', () {
      test('when called then should return `refReqId` if available', () {
        expect(sut.extractRefReqId('https://www.payu.pl?refReqId=2a728c9b'), equals('2a728c9b'));
        expect(sut.extractRefReqId('https://www.payu.pl?refReqId=634563fasdf'), equals('634563fasdf'));
      });

      test('when called then should return `null` if not available', () {
        expect(sut.extractRefReqId('https://www.payu.pl?refReqI=634563fasdf'), equals(null));
        expect(sut.extractRefReqId('https://www.payu.pl?refRqId=634563fasdf'), equals(null));
        expect(sut.extractRefReqId('refReqId=634563fasdf'), equals(null));
        expect(sut.extractRefReqId(''), equals(null));
      });
    });
  });
}
