import 'package:get/get.dart';

import 'package:example/core/routes.dart';
import 'package:example/features/demo_features/controllers/demo_add_card_page_controller.dart';
import 'package:example/features/demo_features/controllers/demo_apple_pay_controller.dart';
import 'package:example/features/demo_features/controllers/demo_mastercard_installments_controller.dart';
import 'package:example/features/demo_features/controllers/demo_payment_methods_controller.dart';
import 'package:example/features/demo_features/controllers/demo_soft_accept_controller.dart';
import 'package:example/features/demo_features/demo_feature.dart';

class DemoFeaturesController extends GetxController {
  final DemoAddCardPageController _demoAddCardPageController;
  final DemoApplePayController _demoApplePayController;
  final DemoMastercardInstallmentsController _demoMastercardInstallmentsController;
  final DemoPaymentMethodsController _demoPaymentMethodsController;
  final DemoSoftAcceptController _demoSoftAcceptController;

  DemoFeaturesController(
    this._demoAddCardPageController,
    this._demoApplePayController,
    this._demoMastercardInstallmentsController,
    this._demoPaymentMethodsController,
    this._demoSoftAcceptController,
  );

  void didTapEnvironments() {
    Get.toNamed(Routes.environments);
  }

  void didTapFeature(DemoFeatureType type) {
    switch (type) {
      case DemoFeatureType.demoAddCardPage:
        _demoAddCardPageController.demo();
        break;
      case DemoFeatureType.demoAddCardWidget:
        Get.toNamed(Routes.demoAddCardWidget);
        break;
      case DemoFeatureType.demoApplePay:
        _demoApplePayController.demo();
        break;
      case DemoFeatureType.demoVaryingNumberOfInstallments:
        _demoMastercardInstallmentsController.demoVaryingNumberOfInstallments();
        break;
      case DemoFeatureType.demoVaryingNumberOfOptions:
        _demoMastercardInstallmentsController.demoVaryingNumberOfOptions();
        break;
      case DemoFeatureType.demoPaymentMethods:
        _demoPaymentMethodsController.demo();
        break;
      case DemoFeatureType.demoPaymentWidget:
        Get.toNamed(Routes.demoPaymentWidget);
        break;
      case DemoFeatureType.demoSoftAccept:
        _demoSoftAcceptController.demo();
        break;
      case DemoFeatureType.demoTermsAndConditions:
        Get.toNamed(Routes.demoTermsAndConditions);
        break;
      case DemoFeatureType.demoTheme:
        Get.toNamed(Routes.demoTheme);
        break;
      case DemoFeatureType.demoWebPaymentsSecure:
        Get.toNamed(Routes.demoWebPaymentsSecure);
        break;
      case DemoFeatureType.exampleOrder:
        Get.toNamed(Routes.exampleProducts);
        break;
    }
  }
}
