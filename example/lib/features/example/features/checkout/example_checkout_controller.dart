import 'package:get/get.dart';

import 'package:example/core/ui/snackbar.dart';
import 'package:example/features/example/core/example_core_controller.dart';
import 'package:example/features/example/features/checkout/controllers/example_checkout_redirect_controller.dart';

class ExampleCheckoutController extends GetxController with StateMixin {
  final ExampleCoreController _controller;
  final ExampleCheckoutRedirectController _redirectController;

  ExampleCheckoutController(this._controller, this._redirectController);

  @override
  void onInit() {
    change(dynamic, status: RxStatus.success());
    super.onInit();
  }

  void didTapGoToCheckoutPayment() async {
    try {
      change(dynamic, status: RxStatus.loading());
      await _redirectController.process(_controller.orderCreateResponse!);
    } catch (e) {
      snackbar(e.toString());
    } finally {
      change(dynamic, status: RxStatus.success());
    }
  }
}
