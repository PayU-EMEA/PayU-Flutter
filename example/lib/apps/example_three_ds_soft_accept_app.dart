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
            onPressed: () => _didTapHandleWarningContinue3DS(context),
            child: const Text('WARNING_CONTINUE_3DS'),
          ),
        ),
      ),
    );
  }

  void _didTapHandleWarningContinue3DS(BuildContext context) async {
    final result = await showDialog<SoftAcceptMessage>(
      context: context,
      builder: (context) => const SoftAcceptAlertDialog(
        request: SoftAcceptRequest(
          redirectUri: 'redirectUri',
        ),
      ),
    );

    if (result != null) debugPrint(result.toString());
  }
}
