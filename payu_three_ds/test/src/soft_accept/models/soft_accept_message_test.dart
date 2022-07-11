import 'package:flutter_test/flutter_test.dart';

import 'package:payu_three_ds/src/soft_accept/models/soft_accept_message.dart';

void main() {
  group('`SoftAcceptMessage`', () {
    group('`fromValue`', () {
      test('when `value` is expected then should return correct `SoftAcceptMessage`', () {
        SoftAcceptMessage fromValue(String value) => SoftAcceptMessageFromExt.fromValue(value);

        expect(fromValue('DISPLAY_FRAME'), equals(SoftAcceptMessage.displayFrame));
        expect(fromValue('AUTHENTICATION_SUCCESSFUL'), equals(SoftAcceptMessage.authenticationSuccessful));
        expect(fromValue('AUTHENTICATION_CANCELED'), equals(SoftAcceptMessage.authenticationCanceled));
        expect(fromValue('AUTHENTICATION_NOT_REQUIRED'), equals(SoftAcceptMessage.authenticationNotRequired));
        expect(fromValue('other'), equals(SoftAcceptMessage.authenticationCanceled));
      });
    });

    group('`value`', () {
      test('when called then should return correct `String` value', () {
        expect(SoftAcceptMessage.displayFrame.value, equals('DISPLAY_FRAME'));
        expect(SoftAcceptMessage.authenticationSuccessful.value, equals('AUTHENTICATION_SUCCESSFUL'));
        expect(SoftAcceptMessage.authenticationCanceled.value, equals('AUTHENTICATION_CANCELED'));
        expect(SoftAcceptMessage.authenticationNotRequired.value, equals('AUTHENTICATION_NOT_REQUIRED'));
      });
    });
  });
}
