import 'dart:io';

import 'package:example/core/ui/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:payu/payu.dart';

void main() {
  Payu.debug = true;
  Payu.locale = const Locale('en');
  Payu.environment = Environment.sandbox;
  Payu.pos = const POS(id: '300746');

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PayuMobilePayments _service;

  @override
  void initState() {
    _service = PayuMobilePayments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Payu.theme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: Platform.isIOS ? _didTapPayWithApplePay : null,
              child: const Text('ApplePay'),
            ),
            TextButton(
              onPressed: Platform.isAndroid ? _didTapPayWithGooglePay : null,
              child: const Text('GooglePay'),
            ),
          ],
        ),
      ),
    );
  }

  void _didTapPayWithApplePay() {
    _didTapPay(_buildApplePayPaymentConfiguration());
  }

  void _didTapPayWithGooglePay() {
    _didTapPay(_buildGooglePayPaymentConfiguration());
  }

  void _didTapPay(PaymentConfiguration paymentConfiguration) async {
    if (await _service.canMakePayment(paymentConfiguration)) {
      final authorizationCode = await _service.makePayment(paymentConfiguration);
      snackbar('authorizationCode: $authorizationCode');
    }
  }

  PaymentConfiguration _buildApplePayPaymentConfiguration() {
    return PaymentConfiguration.applePay(
      request: ApplePayPaymentRequestBuilder()
          .withCountryCode('PL')
          .withCurrencyCode('PLN')
          .withMerchantIdentifier('merchantIdentifier')
          .withShippingContact(
            const ApplePayContact(
              emailAddress: 'email@address.com',
            ),
          )
          .withPaymentSummaryItems(
        const [
          ApplePaySummaryItem(label: 'Futomaki', amount: 1599),
          ApplePaySummaryItem(label: 'Napkin', amount: 49),
          ApplePaySummaryItem(label: 'Order', amount: 1599 + 49),
        ],
      ).build(),
    );
  }

  PaymentConfiguration _buildGooglePayPaymentConfiguration() {
    return PaymentConfiguration.googlePay(
      environment: PaymentEnvironment.test,
      request: GooglePayPaymentDataRequestBuilder()
          .withMerchantId('merchantId')
          .withMerchantName('merchantName')
          .withCountryCode('PL')
          .withCurrencyCode('PLN')
          .withTotalPrice('1.23')
          .build(),
    );
  }
}
