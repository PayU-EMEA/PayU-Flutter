import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';

import 'about_item.dart';

class AboutController extends PayuController {
  final PayuLauncher _launcher;

  final List<AboutItem> items = [
    AboutItem.publisher(),
    AboutItem.customerService(),
  ];

  AboutController(this._launcher);

  void didTapItem(AboutItem item) async {
    if (item.type == AboutItemType.customerService) {
      await _launcher.call(item.value);
    }
  }
}
