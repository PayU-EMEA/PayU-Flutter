import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';

import '../exceptions/add_card_exception.dart';
import '../service/add_card_service.dart';

mixin AddCardPageControllerDelegate {
  void didComplete(CardToken token);
  void didFail(String message);
}

class AddCardPageController extends PayuController {
  final AddCardPageControllerDelegate _delegate;
  late AddCardService _service;

  AddCardPageController(this._delegate);

  void didUpdateService(AddCardService service) {
    _service = service;
  }

  Future tokenize(bool agreement) async {
    try {
      final token = await _service.tokenize(agreement);
      _delegate.didComplete(token);
    } on AddCardException catch (_) {
    } catch (e) {
      _delegate.didFail(e.toString());
    }
  }
}
