import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/core/routes.dart';
import 'package:example/core/ui/snackbar.dart';
import 'package:example/data/models/pay_method.dart';
import 'package:example/data/models/payment_methods_response.dart';
import 'package:example/data/repositories/data_repository.dart';
import 'package:example/data/repositories/secure_storage.dart';
import 'package:example/features/example/core/example_core_controller.dart';
import 'package:example/features/example/features/method/processors/example_method_processor.dart';

class ExampleMethodController extends GetxController with StateMixin implements PaymentMethodsListener {
  final ExampleMethodProcessor _processor;
  final ExampleCoreController _controller;
  final DataRepository _repository;
  final SecureStorage _storage;

  final method = Rxn<PayMethod>();
  final redirectUri = Rxn<String>();
  final result = Rxn<WebPaymentsResult>();

  ExampleMethodController(this._controller, this._processor, this._repository, this._storage);

  @override
  void onInit() {
    change(dynamic, status: RxStatus.success());
    super.onInit();
  }

  void didTapOpenPaymentMethods() async {
    try {
      change(dynamic, status: RxStatus.loading());
      final response = await _repository.getPaymentMethods();
      _navigateToPaymentMethods(response);
    } catch (e) {
      snackbar(e.toString());
    } finally {
      change(dynamic, status: RxStatus.success());
    }
  }

  void didTapOpenTestCards() async {
    final result = await Get.toNamed(Routes.exampleTestCards);
    if (result is CardToken) _processPaymentMethod(result);
  }

  void _navigateToPaymentMethods(PaymentMethodsResponse response) async {
    final result = await Get.to<PaymentMethod>(
      () => PaymentMethodsPage(
        configuration: PaymentMethodsConfiguration(
          blikTokens: response.blikTokens,
          cardTokens: response.cardTokens,
          payByLinks: response.payByLinks,
        ),
        listener: this,
        storage: _storage,
      ),
    );

    if (result != null) _processPaymentMethod(result);
  }

  void _processPaymentMethod(PaymentMethod paymentMethod) {
    _processor.process(
      method: paymentMethod,
      onProcessed: (payMethod) {
        snackbar(payMethod.toString());
        _controller.setMethod(payMethod);
        Get.toNamed(Routes.exampleOrder);
      },
    );
  }

  @override
  void didDeletePaymentMethod(PaymentMethod paymentMethod) {
    snackbar('didDeletePaymentMethod: ${paymentMethod.toString()}');
  }
}
