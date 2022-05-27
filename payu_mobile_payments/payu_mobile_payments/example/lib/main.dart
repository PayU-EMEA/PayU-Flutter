import 'package:flutter/material.dart';
import 'package:payu_mobile_payments/payu_mobile_payments.dart';

// TODO: - Add payu_mobile_payment to scripts
// TODO: - Change bundle ids
// TODO: - Add tests for ApplePay and GooglePay

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () async {
                  final canMakePayment =
                      await PayuMobilePayments().canMakePayment(_buildApplePayPaymentConfiguration());
                  debugPrint('✅ canMakePayment: $canMakePayment');
                },
                child: const Text('ApplePay / canMakePayments'),
              ),
              TextButton(
                onPressed: () async {
                  final makePayment = await PayuMobilePayments().makePayment(_buildApplePayPaymentConfiguration());
                  debugPrint('✅ makePayment: $makePayment');
                },
                child: const Text('ApplePay / makePayment'),
              ),
              TextButton(
                onPressed: () async {
                  final canMakePayment =
                      await PayuMobilePayments().canMakePayment(_buildGooglePayPaymentConfiguration());
                  debugPrint('✅ canMakePayment: $canMakePayment');
                },
                child: const Text('GooglePay / canMakePayments'),
              ),
              TextButton(
                onPressed: () async {
                  final makePayment = await PayuMobilePayments().makePayment(_buildGooglePayPaymentConfiguration());
                  debugPrint('✅ makePayment: $makePayment');
                },
                child: const Text('GooglePay / makePayment'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PaymentConfiguration _buildApplePayPaymentConfiguration() {
    return PaymentConfiguration.applePay(
      request: _buildApplePayPaymentRequest(),
    );
  }

  PaymentConfiguration _buildGooglePayPaymentConfiguration() {
    return PaymentConfiguration.googlePay(
      environment: PaymentEnvironment.test,
      request: _buildGooglePayPaymentDataRequest(),
    );
  }

  ApplePayPaymentRequest _buildApplePayPaymentRequest() {
    return const ApplePayPaymentRequest(
      merchantIdentifier: 'merchant.identifier',
      countryCode: 'PL',
      currencyCode: 'PLN',
      shippingContact: ApplePayContact(emailAddress: 'customer@email.com'),
      paymentSummaryItems: [
        ApplePaySummaryItem(label: 'Futomaki', amount: 1599),
        ApplePaySummaryItem(label: 'Napkin', amount: 49),
        ApplePaySummaryItem(label: 'Order', amount: 1599 + 49),
      ],
    );
  }

  GooglePayPaymentDataRequest _buildGooglePayPaymentDataRequest() {
    return GooglePayPaymentDataRequest.payu(
      merchantId: 'merchantId',
      merchantName: 'merchantName',
      currencyCode: 'PLN',
      countryCode: 'PL',
      totalPrice: '1.23',
    );
  }
}
