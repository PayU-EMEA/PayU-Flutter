import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:payu_ui/payu_ui.dart';

import '../add_card_widget_configuration.dart';
import 'add_card_text_field_controller.dart';

class AddCardTextField extends StatelessWidget {
  final AddCardTextFieldController controller;
  final AddCardWidgetTextInputDecoration decoration;

  const AddCardTextField({
    Key? key,
    required this.controller,
    required this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PayuProviderWidget<AddCardTextFieldController>(
      create: (context) => controller,
      builder: (context, controller) => Padding(
        padding: const EdgeInsets.symmetric(vertical: PayuPadding.padding8),
        child: SizedBox(
          child: FocusScope(
            onFocusChange: (value) => controller.didUpdateFocus(value),
            child: TextField(
              controller: controller.textEditingController,
              decoration: InputDecoration(
                hintText: decoration.hintText,
                labelText: decoration.labelText,
                errorText: controller.errorText,
                hintMaxLines: 2,
                errorMaxLines: 2,
                helperMaxLines: 2,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                controller.formatter,
              ],
              keyboardType: TextInputType.number,
            ),
          ),
        ),
      ),
    );
  }
}
