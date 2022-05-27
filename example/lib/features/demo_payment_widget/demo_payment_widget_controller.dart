import 'package:example/core/ui/snackbar.dart';
import 'package:example/data/models/pay_method.dart';
import 'package:example/data/models/pay_method_type.dart';
import 'package:example/data/repositories/secure_storage.dart';
import 'package:example/features/example/backend/data/repositories/backend_repository.dart';
import 'package:get/get.dart';
import 'package:payu/payu.dart';

class DemoPaymentWidgetController extends GetxController with StateMixin {
  final BackendRepository _repository;
  final PayuMobilePayments _payments;
  final PaymentWidgetService service;
  final SecureStorage storage;

  final configuration = Rxn<PaymentMethodsConfiguration>();
  final method = Rxn<PaymentMethod>();

  DemoPaymentWidgetController(this._repository, this._payments, this.service, this.storage);

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
      onGooglePay: (value) => _processGooglePayPayment(value),
      onInstallments: (value) => _processInstallmentsPayment(value),
      onPayByLink: (value) => _processPayByLinkPayment(value),
    );
  }

  void _processApplePayPayment(ApplePay value) async {
    _processMobilePayment(
      PaymentConfiguration.applePay(
        request: ApplePayPaymentRequestBuilder()
            .withCountryCode('PL')
            .withCurrencyCode('PLN')
            .withMerchantIdentifier('merchantIdentifier')
            .withShippingContact(
              const ApplePayContact(
                emailAddress: 'email@address.com',
              ),
            )
            .withPaymentSummaryItems(
          const [
            ApplePaySummaryItem(label: 'Futomaki', amount: 1599),
            ApplePaySummaryItem(label: 'Napkin', amount: 49),
            ApplePaySummaryItem(label: 'Order', amount: 1599 + 49),
          ],
        ).build(),
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

  void _processGooglePayPayment(GooglePay value) {
    _processMobilePayment(
      PaymentConfiguration.googlePay(
        environment: PaymentEnvironment.test,
        request: GooglePayPaymentDataRequestBuilder()
            .withMerchantId('merchantId')
            .withMerchantName('merchantName')
            .withCountryCode('PL')
            .withCurrencyCode('PLN')
            .withTotalPrice('1.23')
            .build(),
      ),
    );
  }

  void _processInstallmentsPayment(Installments value) {
    _processPayment(PayMethod(type: PayMethodType.pbl, value: value.value));
  }

  void _processMobilePayment(PaymentConfiguration paymentConfiguration) async {
    if (await _payments.canMakePayment(paymentConfiguration)) {
      final authorizationCode = await _payments.makePayment(paymentConfiguration);
      snackbar('authorizationCode: ${authorizationCode?.substring(0, 10)}...}');
    } else {
      snackbar('cannotMakePayments');
    }
  }

  void _processPayByLinkPayment(PayByLink value) {
    _processPayment(PayMethod(type: PayMethodType.pbl, value: value.value));
  }

  void _processPayment(PayMethod value) {
    snackbar(value.toString());
  }
}
