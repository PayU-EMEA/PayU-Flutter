import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';
import 'package:payu_add_card/payu_add_card.dart';

import '../network/client/card_installments_network_client.dart';
import '../finders/payment_card_provider_finder.dart';
import '../helpers/installments_label.dart';
import '../models/payment_card.dart';
import '../models/payment_card_provider.dart';
import 'card_installments_controller.dart';
import 'widgets/add_card_text_field_controller.dart';

class AddCardWidgetController extends PayuController with AddCardServiceDelegate {
  final AddCardTextFieldController cvvController;
  final AddCardTextFieldController dateController;
  final AddCardTextFieldController numberController;

  final AddCardService _service;
  final PaymentCardProviderFinder _finder;
  late final CardInstallmentsController installments;

  PaymentCardProvider? cardProvider;

  AddCardWidgetController(
    this.cvvController,
    this.dateController,
    this.numberController,
    this._service,
    this._finder,
    CardInstallmentsNetworkClient cardInstallmentsClient,
  ) {
    installments = CardInstallmentsController(
      client: cardInstallmentsClient,
      onChanged: notifyListeners,
    );
  }

  @override
  void onInit() {
    super.onInit();
    _service.delegate = this;

    final textEditingController = numberController.textEditingController;
    textEditingController.addListener(() => _numberDidChange());
  }

  void _numberDidChange() {
    final number = numberController.textEditingController.text;
    cardProvider = _finder.find(number);
    if (Payu.cardInstallments) {
      installments.didUpdateDigits(number.digitsOnly);
    }
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
  CardTokenInstallments? cardInstallments() {
    final provider = installments.cardInstallmentsOptions?.provider;
    final number = installments.selectedNumber;

    if (provider == null || number == null || number == 1) {
      return null;
    }

    return CardTokenInstallments(
      provider: provider,
      number: number,
      numberLabel: InstallmentsLabel.build(number),
    );
  }

  @override
  void validate() {
    try {
      cvvController.prevalidate();
      dateController.prevalidate();
      numberController.prevalidate();
      if (Payu.cardInstallments) {
        installments.prevalidate();
      }

      cvvController.validate();
      dateController.validate();
      numberController.validate();
      if (Payu.cardInstallments) {
        installments.validate();
      }

    } catch (e) {
      rethrow;
    }
  }
}
