import 'package:example/core/ui/snackbar.dart';
import 'package:example/data/repositories/secure_storage.dart';
import 'package:example/features/example/backend/data/repositories/backend_repository.dart';
import 'package:get/get.dart';
import 'package:payu/payu.dart';

class DemoPaymentMethodsController extends GetxController implements PaymentMethodsListener {
  final BackendRepository _repository;
  final SecureStorage _storage;

  DemoPaymentMethodsController(this._repository, this._storage);

  void demo() async {
    final response = await _repository.getPaymentMethods();

    final method = await Get.to<PaymentMethod>(
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
    if (method == null) return;

    PaymentMethodsProcessor().process(
      method: method,
      onApplePay: (value) => snackbar(value.toString()),
      onBlikCode: (value) => snackbar(value.toString()),
      onBlikToken: (value) => snackbar(value.toString()),
      onCardToken: (value) => snackbar(value.toString()),
      onGooglePay: (value) => snackbar(value.toString()),
      onInstallments: (value) => snackbar(value.toString()),
      onPayByLink: (value) => snackbar(value.toString()),
      onOther: (value) => snackbar(value.toString()),
    );
  }

  @override
  void didDeletePaymentMethod(PaymentMethod paymentMethod) {
    snackbar('didDeletePaymentMethod: ${paymentMethod.toString()}');
  }
}
