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
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Payu.theme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: const TermsAndConditionsWidget(),
      ),
    );
  }
}
