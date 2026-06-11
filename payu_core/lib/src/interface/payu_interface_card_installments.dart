import 'package:payu_interface/payu_interface.dart';

extension PayuInterfaceCardInstallments on PayuInterface {
  static var _cardInstallments = false;

  bool get cardInstallments => _cardInstallments;

  set cardInstallments(bool cardInstallments) => _cardInstallments = cardInstallments;
}
