import 'package:flutter/services.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:payu_apple_pay/src/service/apple_pay_platform.dart';
import 'package:payu_apple_pay/src/service/apple_pay_service.dart';
import 'package:payu_apple_pay/src/service/apple_pay_service_method.dart';
import 'apple_pay_service_test.mocks.dart';

@GenerateMocks([
  ApplePayPlatform,
  MethodChannel,
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ApplePayService', () {
    late MockApplePayPlatform platform;
    late MockMethodChannel inputChannel;
    late MockMethodChannel outputChannel;
    late ApplePayService sut;

    setUp(() {
      platform = MockApplePayPlatform();
      inputChannel = MockMethodChannel();
      outputChannel = MockMethodChannel();

      sut = ApplePayService(platform, inputChannel, outputChannel);
    });

    group('`canMakePayments`', () {
      const method = ApplePayServiceMethod.canMakePayments;

      test('when called then should invoke input channel method', () async {
        when(inputChannel.invokeMethod(method)).thenAnswer((e) async => true);
        when(platform.isiOS()).thenReturn(false);
        await sut.canMakePayments();
        verify(inputChannel.invokeMethod(method));
      });

      test('when called then should invoke platfrom check', () async {
        when(inputChannel.invokeMethod(method)).thenAnswer((e) async => true);
        when(platform.isiOS()).thenReturn(false);
        await sut.canMakePayments();
        verify(platform.isiOS());
      });

      test('when `inputChannel` returns true and `platform` is iOS then should return true', () async {
        when(inputChannel.invokeMethod(method)).thenAnswer((e) async => true);
        when(platform.isiOS()).thenReturn(true);
        expect(await sut.canMakePayments(), equals(true));
      });

      test('when `inputChannel` returns false and `platform` is iOS then should return false', () async {
        when(inputChannel.invokeMethod(method)).thenAnswer((e) async => false);
        when(platform.isiOS()).thenReturn(true);
        expect(await sut.canMakePayments(), equals(false));
      });

      test('when `inputChannel` returns true and `platform` is not iOS then should return false', () async {
        when(inputChannel.invokeMethod(method)).thenAnswer((e) async => true);
        when(platform.isiOS()).thenReturn(false);
        expect(await sut.canMakePayments(), equals(false));
      });

      test('when `inputChannel` returns false and `platform` is not iOS then should return false', () async {
        when(inputChannel.invokeMethod(method)).thenAnswer((e) async => false);
        when(platform.isiOS()).thenReturn(false);
        expect(await sut.canMakePayments(), equals(false));
      });
    });
  });
}
