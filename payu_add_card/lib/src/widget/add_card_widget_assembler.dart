import 'package:payu_api/payu_api.dart';
import 'package:payu_state_management/payu_state_management.dart';

import '../finders/payment_card_provider_finder.dart';
import '../helpers/card_data_formatter.dart';
import '../helpers/card_data_validator.dart';
import '../helpers/card_date_parser.dart';
import '../helpers/card_luhn_validator.dart';
import '../network/client/add_card_network_client.dart';
import '../service/add_card_service.dart';
import 'add_card_widget_controller.dart';
import 'widgets/add_card_text_field_controller.dart';

class AddCardWidgetAssembler extends PayuAssembler {
  final Function(AddCardWidgetAssembler) onAssembled;

  AddCardWidgetAssembler({required this.onAssembled});

  @override
  void assemble() {
    register(() => CardDateParser());
    register(() => CardLuhnValidator());
    register(() => PaymentCardProviderFinder(find()));

    register<CardDataValidator>(() => CardCVVValidator(), name: 'v.cvv');
    register<CardDataValidator>(() => CardDateValidator(find()), name: 'v.date');
    register<CardDataValidator>(() => CardNumberValidator(find()), name: 'v.number');

    register(() => CardDataFormatter.cvv(), name: 'f.cvv');
    register(() => CardDataFormatter.date(), name: 'f.date');
    register(() => CardDataFormatter.number(), name: 'f.number');

    register(() => SecureHttpClient.create());
    register(() => AddCardNetworkClient(find()));
    register(() => AddCardService(find(), find()));

    register(() => AddCardTextFieldController(find(name: 'v.cvv'), find(name: 'f.cvv')), name: 'c');
    register(() => AddCardTextFieldController(find(name: 'v.date'), find(name: 'f.date')), name: 'd');
    register(() => AddCardTextFieldController(find(name: 'v.number'), find(name: 'f.number')), name: 'n');

    register(() => AddCardWidgetController(find(name: 'c'), find(name: 'd'), find(name: 'n'), find(), find()));

    onAssembled(this);

    super.assemble();
  }

  @override
  void dispose() {
    unregister<CardDateParser>();
    unregister<CardLuhnValidator>();
    unregister<PaymentCardProviderFinder>();

    unregister<CardDataValidator>(name: 'v.cvv');
    unregister<CardDataValidator>(name: 'v.date');
    unregister<CardDataValidator>(name: 'v.number');

    unregister<CardDataFormatter>(name: 'f.cvv');
    unregister<CardDataFormatter>(name: 'f.date');
    unregister<CardDataFormatter>(name: 'f.number');

    unregister<SecureHttpClient>();
    unregister<AddCardNetworkClient>();
    unregister<AddCardService>();

    unregister<AddCardTextFieldController>(name: 'c');
    unregister<AddCardTextFieldController>(name: 'd');
    unregister<AddCardTextFieldController>(name: 'n');

    unregister<AddCardWidgetController>();

    super.dispose();
  }
}
