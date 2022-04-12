import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';

class TermsAndConditionsController extends PayuController {
  final PayuLauncher _launcher;

  TermsAndConditionsController(this._launcher);

  void didTap(String uri) async {
    await _launcher.launch(uri);
  }
}
