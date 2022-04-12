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
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements ApplePayListener {
  late final ApplePayService _service;

  @override
  void initState() {
    _service = ApplePayService.instance();
    _service.setListener(this);
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
        body: Center(
          child: TextButton(
            onPressed: () => _didTapPay(),
            child: const Text(' Pay'),
          ),
        ),
      ),
    );
  }

  void _didTapPay() async {
    if (await _service.canMakePayments()) {
      await _service.authorize(
        request: const ApplePayPaymentRequest(
          merchantIdentifier: 'merchant.identifier',
          countryCode: 'PL',
          currencyCode: 'PLN',
          shippingContact: ApplePayContact(emailAddress: 'customer@email.com'),
          paymentSummaryItems: [
            ApplePaySummaryItem(label: 'Futomaki', amount: 1599),
            ApplePaySummaryItem(label: 'Napkin', amount: 49),
            ApplePaySummaryItem(label: 'Order', amount: 1599 + 49),
          ],
        ),
      );
    }
  }

  @override
  void onDidAuthorize(String authorizationCode) {
    debugPrint('onDidAuthorize: $authorizationCode');
  }

  @override
  void onDidCancel() {
    debugPrint('onDidCancel');
  }
}
