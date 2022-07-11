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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            onPressed: () => _didTapMastercardInstallments(context),
            child: const Text('Mastercard Installments'),
          ),
        ),
      ),
    );
  }

  void _didTapMastercardInstallments(BuildContext context) async {
    final result = await Navigator.of(context).push<InstallmentResult>(
      MaterialPageRoute(
        builder: (context) => InstallmentsOfferPage(
          proposal: _buildInstallmentProposal(),
        ),
      ),
    );

    debugPrint(result?.toString() ?? 'null');
  }

  InstallmentProposal _buildInstallmentProposal() {
    return const InstallmentProposal(
      id: '2bd92572-d32f-4aa8-b486-be51629811e5',
      cardScheme: 'MC',
      installmentOptionFormat: InstallmentOptionFormat.varyingNumberOfOptions,
      currencyCode: 'PLN',
      installmentOptions: [
        InstallmentOption(
          id: '1',
          interestRate: 5.4,
          installmentFeeAmount: 1000,
          annualPercentageRate: 17.93,
          totalAmountDue: 49440,
          firstInstallmentAmount: 16480,
          installmentAmount: 16480,
          numberOfInstallments: 3,
        ),
        InstallmentOption(
          id: '2',
          interestRate: 5.2,
          installmentFeeAmount: 1100,
          annualPercentageRate: 13.05,
          totalAmountDue: 49848,
          firstInstallmentAmount: 8308,
          installmentAmount: 8308,
          numberOfInstallments: 6,
        ),
        InstallmentOption(
          id: '3',
          interestRate: 5,
          installmentFeeAmount: 1200,
          annualPercentageRate: 9.64,
          totalAmountDue: 50544,
          firstInstallmentAmount: 4344,
          installmentAmount: 4200,
          numberOfInstallments: 12,
        ),
      ],
    );
  }
}
