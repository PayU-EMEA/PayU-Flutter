import 'package:flutter/material.dart';

import 'package:payu_state_management/payu_state_management.dart';

import '../../helpers/card_data_formatter.dart';
import '../../helpers/card_data_validator.dart';

class AddCardTextFieldController extends PayuController {
  final CardDataValidator validator;
  final CardDataFormatter formatter;

  final textEditingController = TextEditingController();

  String? errorText;

  AddCardTextFieldController(this.validator, this.formatter);

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void didUpdateFocus(bool focused) {
    focused ? reset() : prevalidate();
  }

  void prevalidate() {
    try {
      validator.validate(textEditingController.text);
      errorText = null;
    } catch (e) {
      errorText = e.toString();
    } finally {
      notifyListeners();
    }
  }

  void validate() {
    try {
      validator.validate(textEditingController.text);
    } catch (e) {
      rethrow;
    }
  }

  void reset() {
    errorText = null;
    notifyListeners();
  }
}
