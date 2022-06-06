import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_card_parameters.dart';

void main() {
  group('GooglePayCardParameters', () {
    test('`constants` are correct', () {
      expect(GooglePayCardParameters.allowedAuthMethodPanOnly, equals('PAN_ONLY'));
      expect(GooglePayCardParameters.allowedAuthMethodCryptogram3DS, equals('CRYPTOGRAM_3DS'));
      expect(GooglePayCardParameters.allowedCardNetworkMastercard, equals('MASTERCARD'));
      expect(GooglePayCardParameters.allowedCardNetworkVisa, equals('VISA'));
    });

    group('`toJson`', () {
      test('when called then should map model correctly', () {
        const sut = GooglePayCardParameters(
          allowedAuthMethods: [
            GooglePayCardParameters.allowedAuthMethodPanOnly,
            GooglePayCardParameters.allowedAuthMethodCryptogram3DS,
          ],
          allowedCardNetworks: [
            GooglePayCardParameters.allowedCardNetworkMastercard,
            GooglePayCardParameters.allowedCardNetworkVisa,
          ],
        );

        final json = sut.toJson();
        expect(json['allowedAuthMethods'], equals(['PAN_ONLY', 'CRYPTOGRAM_3DS']));
        expect(json['allowedCardNetworks'], equals(['MASTERCARD', 'VISA']));
      });
    });
  });
}
