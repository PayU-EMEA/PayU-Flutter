import 'package:flutter/material.dart';

import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';
import 'package:payu_terms_and_conditions/payu_terms_and_conditions.dart';
import 'package:payu_translations/payu_translations.dart';
import 'package:payu_ui/payu_ui.dart';

import '../widget/add_card_widget.dart';
import '../widget/add_card_widget_configuration.dart';
import 'add_card_page_assembler.dart';
import 'add_card_page_controller.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> with AddCardPageControllerDelegate {
  @override
  Widget build(BuildContext context) {
    return PayuWidget<AddCardPageController, AddCardPageAssembler>(
      assembler: () => AddCardPageAssembler(this),
      builder: (context, controller) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: PayuImage.logo(),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  PayuPadding.padding16,
                  PayuPadding.padding16,
                  PayuPadding.padding16,
                  PayuPadding.padding64,
                ),
                child: Column(
                  children: [
                    AddCardWidget(
                      onCreated: (service) => controller.didUpdateService(service),
                      configuration: AddCardWidgetConfiguration.payu(),
                    ),
                    const SizedBox(
                      height: PayuPadding.padding32,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () => controller.tokenize(true),
                        child: Text('save_and_use'.translated()),
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: OutlinedButton(
                        onPressed: () => controller.tokenize(false),
                        child: Text('use'.translated()),
                      ),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.maxFinite,
                  child: TermsAndConditionsWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didComplete(CardToken token) {
    Navigator.of(context).pop(token);
  }

  @override
  void didFail(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: PayuColors.tertiary2,
      ),
    );
  }
}
