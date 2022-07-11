import 'package:payu_translations/payu_translations.dart';

class AddCardWidgetConfiguration {
  final AddCardWidgetTextInputDecoration cvvDecoration;
  final AddCardWidgetTextInputDecoration numberDecoration;
  final AddCardWidgetTextInputDecoration dateDecoration;
  final bool isFooterVisible;

  AddCardWidgetConfiguration({
    required this.cvvDecoration,
    required this.dateDecoration,
    required this.numberDecoration,
    required this.isFooterVisible,
  });

  factory AddCardWidgetConfiguration.payu() {
    return AddCardWidgetConfiguration(
      cvvDecoration: AddCardWidgetTextInputDecoration.cvv(),
      dateDecoration: AddCardWidgetTextInputDecoration.date(),
      numberDecoration: AddCardWidgetTextInputDecoration.number(),
      isFooterVisible: false,
    );
  }
}

class AddCardWidgetTextInputDecoration {
  final String? hintText;
  final String? labelText;

  const AddCardWidgetTextInputDecoration({
    this.hintText,
    this.labelText,
  });

  factory AddCardWidgetTextInputDecoration.cvv() {
    return AddCardWidgetTextInputDecoration(
      hintText: 'cvv_code'.translated(),
    );
  }

  factory AddCardWidgetTextInputDecoration.date() {
    return AddCardWidgetTextInputDecoration(
      hintText: 'MM/YY'.translated(),
    );
  }

  factory AddCardWidgetTextInputDecoration.number() {
    return AddCardWidgetTextInputDecoration(
      hintText: 'card_number'.translated(),
    );
  }
}
