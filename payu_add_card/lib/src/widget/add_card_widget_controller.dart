import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';

import 'package:payu_add_card/payu_add_card.dart';
import '../finders/payment_card_provider_finder.dart';
import '../models/payment_card.dart';
import '../models/payment_card_provider.dart';
import 'widgets/add_card_text_field_controller.dart';

class AddCardWidgetController extends PayuController with AddCardServiceDelegate {
  final AddCardTextFieldController cvvController;
  final AddCardTextFieldController dateController;
  final AddCardTextFieldController numberController;

  final AddCardService _service;
  final PaymentCardProviderFinder _finder;

  PaymentCardProvider? cardProvider;

  AddCardWidgetController(
    this.cvvController,
    this.dateController,
    this.numberController,
    this._service,
    this._finder,
  );

  @override
  void onInit() {
    super.onInit();
    _service.delegate = this;

    final textEditingController = numberController.textEditingController;
    textEditingController.addListener(() => _numberDidChange());
  }

  void _numberDidChange() {
    cardProvider = _finder.find(numberController.textEditingController.text);
    notifyListeners();
  }

  // AddCardServiceDelegate
  @override
  PaymentCard card() {
    return PaymentCard(
      number: numberController.textEditingController.text.digitsOnly,
      expirationMonth: dateController.textEditingController.text.split('/')[0],
      expirationYear: dateController.textEditingController.text.split('/')[1],
      cvv: cvvController.textEditingController.text.digitsOnly,
    );
  }

  @override
  void validate() {
    try {
      cvvController.prevalidate();
      dateController.prevalidate();
      numberController.prevalidate();

      cvvController.validate();
      dateController.validate();
      numberController.validate();
    } catch (e) {
      rethrow;
    }
  }
}
