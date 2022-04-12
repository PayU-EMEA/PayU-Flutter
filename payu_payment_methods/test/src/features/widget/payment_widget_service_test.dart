import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:payu_payment_methods/src/features/widget/payment_widget_service.dart';
import 'payment_widget_service_test.mocks.dart';

@GenerateMocks([
  PaymentWidgetServiceDelegate,
])
void main() {
  group('`PaymentWidgetService`', () {
    late MockPaymentWidgetServiceDelegate delegate;
    late PaymentWidgetService sut;

    setUp(() {
      delegate = MockPaymentWidgetServiceDelegate();
      sut = PaymentWidgetService();
    });

    group('`blikAuthorizationCode`', () {
      test('when `delegate` is not set then should return `null`', () {
        expect(sut.blikAuthorizationCode(), equals(null));
      });

      test('when `delegate` is set then should return value from `delegate`', () {
        sut.delegate = delegate;

        when(delegate.blikAuthorizationCode()).thenReturn('123123');
        expect(sut.blikAuthorizationCode(), equals('123123'));
        verify(delegate.blikAuthorizationCode());

        when(delegate.blikAuthorizationCode()).thenReturn('456456');
        expect(sut.blikAuthorizationCode(), equals('456456'));
        verify(delegate.blikAuthorizationCode());
      });
    });

    group('`isBlikAuthorizationCodeRequired`', () {
      test('when `delegate` is not set then should return `false`', () {
        expect(sut.isBlikAuthorizationCodeRequired(), equals(false));
      });

      test('when `delegate` is set then should return value from `delegate`', () {
        sut.delegate = delegate;

        when(delegate.isBlikAuthorizationCodeRequired()).thenReturn(true);
        expect(sut.isBlikAuthorizationCodeRequired(), equals(true));
        verify(delegate.isBlikAuthorizationCodeRequired());

        when(delegate.isBlikAuthorizationCodeRequired()).thenReturn(false);
        expect(sut.isBlikAuthorizationCodeRequired(), equals(false));
        verify(delegate.isBlikAuthorizationCodeRequired());
      });
    });
  });
}
