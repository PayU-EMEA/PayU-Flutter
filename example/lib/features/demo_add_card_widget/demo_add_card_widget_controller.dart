import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/core/ui/snackbar.dart';

class DemoAddCardWidgetController extends GetxController {
  late AddCardService _service;

  void didUpdateService(AddCardService service) {
    _service = service;
  }

  void tokenize(bool save) async {
    try {
      final result = await _service.tokenize(save);
      snackbar(result.toString());
    } catch (e) {
      snackbar(e.toString());
    }
  }
}
