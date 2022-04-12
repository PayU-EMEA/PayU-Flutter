import 'package:get/get.dart';

import 'package:example/core/routes.dart';
import 'package:example/core/ui/snackbar.dart';
import 'package:example/data/repositories/data_repository.dart';
import 'package:example/features/example/core/example_core_controller.dart';

class ExampleOrderController extends GetxController with StateMixin {
  final ExampleCoreController _controller;
  final DataRepository _repository;

  ExampleOrderController(this._controller, this._repository);

  @override
  void onInit() {
    change(dynamic, status: RxStatus.success());
    super.onInit();
  }

  void didTapCreateOrder() async {
    try {
      change(dynamic, status: RxStatus.loading());
      _controller.setResponse(await _repository.createOrder(_controller.method!, _controller.products));
      Get.toNamed(Routes.exampleCheckout);
      snackbar(_controller.orderCreateResponse.toString());
    } catch (e) {
      snackbar(e.toString());
    } finally {
      change(dynamic, status: RxStatus.success());
    }
  }
}
