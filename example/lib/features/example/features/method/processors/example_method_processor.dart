import 'package:example/data/models/pay_method.dart';
import 'package:example/features/example/features/method/processors/example_apple_pay_processor.dart';
import 'package:example/features/example/features/method/processors/example_blik_code_processor.dart';
import 'package:example/features/example/features/method/processors/example_blik_token_processor.dart';
import 'package:example/features/example/features/method/processors/example_card_token_processor.dart';
import 'package:example/features/example/features/method/processors/example_google_pay_processor.dart';
import 'package:example/features/example/features/method/processors/example_installments_processor.dart';
import 'package:example/features/example/features/method/processors/example_pay_by_link_processor.dart';
import 'package:payu/payu.dart';

class ExampleMethodProcessor {
  final ExampleApplePayProcessor _applePayProcessor;
  final ExampleBlikCodeProcessor _blikCodeProcessor;
  final ExampleBlikTokenProcessor _blikTokenProcessor;
  final ExampleCardTokenProcessor _cardTokenProcessor;
  final ExampleGooglePayProcessor _googlePayProcessor;
  final ExampleInstallmentsProcessor _installmentsProcessor;
  final ExamplePayByLinkProcessor _payByLinkProcessor;

  const ExampleMethodProcessor(
    this._applePayProcessor,
    this._blikCodeProcessor,
    this._blikTokenProcessor,
    this._cardTokenProcessor,
    this._googlePayProcessor,
    this._installmentsProcessor,
    this._payByLinkProcessor,
  );

  void process({required PaymentMethod method, required Function(PayMethod) onProcessed}) {
    PaymentMethodsProcessor().process(
      method: method,
      onApplePay: (value) => _applePayProcessor.process(applePay: value, onProcessed: onProcessed),
      onBlikCode: (value) => _blikCodeProcessor.process(blikCode: value, onProcessed: onProcessed),
      onBlikToken: (value) => _blikTokenProcessor.process(blikToken: value, onProcessed: onProcessed),
      onCardToken: (value) => _cardTokenProcessor.process(cardToken: value, onProcessed: onProcessed),
      onGooglePay: (value) => _googlePayProcessor.process(googlePay: value, onProcessed: onProcessed),
      onInstallments: (value) => _installmentsProcessor.process(installments: value, onProcessed: onProcessed),
      onPayByLink: (value) => _payByLinkProcessor.process(payByLink: value, onProcessed: onProcessed),
    );
  }
}
