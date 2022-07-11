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

class _HomePageState extends State<HomePage> {
  late AddCardService _service;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Payu.theme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(32),
                  child: Text('Awesome Widget'),
                ),
                AddCardWidget(
                  configuration: AddCardWidgetConfiguration(
                    cvvDecoration: const AddCardWidgetTextInputDecoration(
                      hintText: 'Awesome cvv hint',
                    ),
                    dateDecoration: const AddCardWidgetTextInputDecoration(
                      hintText: 'Awesome date hint',
                    ),
                    numberDecoration: const AddCardWidgetTextInputDecoration(
                      hintText: 'Awesome number hint',
                    ),
                    isFooterVisible: false,
                  ),
                  onCreated: (service) => _service = service,
                ),
                TextButton(
                  onPressed: () => _tokenize(false),
                  child: const Text('💚 Use'),
                ),
                TextButton(
                  onPressed: () => _tokenize(true),
                  child: const Text('💛 Save and Use'),
                ),
                const TermsAndConditionsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _tokenize(bool save) async {
    final result = await _service.tokenize(false);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('CardPaymentMethod'),
        content: Text(result.toString()),
      ),
    );
  }
}
