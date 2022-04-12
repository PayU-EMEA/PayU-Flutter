import 'package:flutter_test/flutter_test.dart';

import 'package:payu_core/src/models/payment_methods/pay_by_link.dart';
import '../../../resources/resource_reader.dart';

void main() {
  group('PayByLink', () {
    group('`fromJson`', () {
      test('when `json` is correct then should map model correctly', () {
        final json = resource('test_pbl_pay_by_link.json');
        final model = PayByLink.fromJson(json);

        expect(model.brandImageUrl, equals('https://static.payu.com/images/mobile/logos/pbl_m.png'));
        expect(model.status, equals(PayByLinkStatus.enabled));
        expect(model.value, equals('m'));

        expect(model.description, equals(null));
        expect(model.enabled, equals(true));
        expect(model.hash, equals(model.value));
        expect(model.name, equals('mTransfer'));
      });
    });
  });

  group('PayByLinkStatus', () {
    test('should map status correctly', () {
      expect(PayByLinkStatusFromExt.fromValue('ENABLED'), equals(PayByLinkStatus.enabled));
      expect(PayByLinkStatusFromExt.fromValue('DISABLED'), equals(PayByLinkStatus.disabled));
      expect(PayByLinkStatusFromExt.fromValue('TEMPORARY_DISABLED'), equals(PayByLinkStatus.temporaryDisabled));
      expect(PayByLinkStatusFromExt.fromValue('HELLOWORLD'), equals(PayByLinkStatus.unknown));
    });

    test('should map status value correctly', () {
      expect(PayByLinkStatus.enabled.value, equals('ENABLED'));
      expect(PayByLinkStatus.disabled.value, equals('DISABLED'));
      expect(PayByLinkStatus.temporaryDisabled.value, equals('TEMPORARY_DISABLED'));
      expect(PayByLinkStatus.unknown.value, equals('UNKNOWN'));
    });
  });
}
