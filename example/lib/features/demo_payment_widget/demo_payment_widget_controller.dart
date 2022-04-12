import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/core/constants.dart';
import 'package:example/core/ui/snackbar.dart';
import 'package:example/data/models/pay_method.dart';
import 'package:example/data/models/pay_method_type.dart';
import 'package:example/data/repositories/secure_storage.dart';
import 'package:example/features/example/backend/data/repositories/backend_constants.dart';
import 'package:example/features/example/backend/data/repositories/backend_repository.dart';

class DemoPaymentWidgetController extends GetxController with StateMixin implements ApplePayListener {
  final BackendRepository _repository;
  final PaymentWidgetService service;
  final SecureStorage storage;

  final configuration = Rxn<PaymentMethodsConfiguration>();
  final method = Rxn<PaymentMethod>();

  DemoPaymentWidgetController(this._repository, this.service, this.storage);

  @override
  void onInit() async {
    change(dynamic, status: RxStatus.loading());
    final response = await _repository.getPaymentMethods();
    change(dynamic, status: RxStatus.success());

    configuration(
      PaymentMethodsConfiguration(
        blikTokens: response.blikTokens,
        cardTokens: response.cardTokens,
        payByLinks: response.payByLinks,
      ),
    );
    super.onInit();
  }

  void didSelectPaymentMethod(PaymentMethod value) {
    method.value = value;
    change(dynamic, status: RxStatus.success());
  }

  void didTapPay() {
    PaymentMethodsProcessor().process(
      method: method()!,
      onApplePay: (value) => _processApplePayPayment(value),
      onBlikCode: (value) => _processBlikCodePayment(value),
      onBlikToken: (value) => _processBlikTokenPayment(value),
      onCardToken: (value) => _processCardTokenPayment(value),
      onInstallments: (value) => _processInstallmentsPayment(value),
      onPayByLink: (value) => _processPayByLinkPayment(value),
    );
  }

  void _processApplePayPayment(ApplePay value) async {
    final service = ApplePayService.instance();
    service.setListener(this);

    if (await service.canMakePayments() == false) {
      snackbar('Cannot make Apple Pay payments');
      return null;
    }

    await service.authorize(
      request: const ApplePayPaymentRequest(
        merchantIdentifier: Constants.merchantIdentifier,
        countryCode: 'PL',
        currencyCode: 'PLN',
        shippingContact: ApplePayContact(
          emailAddress: BackendConstants.buyerEmail,
        ),
        paymentSummaryItems: [
          ApplePaySummaryItem(label: 'Futomaki', amount: 1999),
          ApplePaySummaryItem(label: 'Napkin', amount: 49),
          ApplePaySummaryItem(label: 'Order', amount: 1999 + 49),
        ],
      ),
    );
  }

  void _processBlikCodePayment(BlikCode value) {
    final code = service.blikAuthorizationCode();

    code == null
        ? snackbar('Please enter the BLIK code')
        : _processPayment(PayMethod(type: PayMethodType.blikToken, authorizationCode: code));
  }

  void _processBlikTokenPayment(BlikToken value) {
    final code = service.blikAuthorizationCode();

    code == null
        ? _processPayment(PayMethod(type: PayMethodType.blikToken, value: value.value))
        : _processPayment(PayMethod(type: PayMethodType.blikToken, authorizationCode: code));
  }

  void _processCardTokenPayment(CardToken value) {
    _processPayment(PayMethod(type: PayMethodType.cardToken, value: value.value));
  }

  void _processInstallmentsPayment(Installments value) {
    _processPayment(PayMethod(type: PayMethodType.pbl, value: value.value));
  }

  void _processPayByLinkPayment(PayByLink value) {
    _processPayment(PayMethod(type: PayMethodType.pbl, value: value.value));
  }

  void _processPayment(PayMethod value) {
    snackbar(value.toString());
  }

  @override
  void onDidAuthorize(String authorizationCode) {
    snackbar('onDidAuthorize ${authorizationCode.substring(0, 10)}...');
  }

  @override
  void onDidCancel() {
    snackbar('onDidCancel');
  }
}
