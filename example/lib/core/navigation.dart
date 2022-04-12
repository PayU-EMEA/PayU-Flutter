import 'package:get/route_manager.dart';

import 'package:example/core/routes.dart';
import 'package:example/features/demo_add_card_widget/demo_add_card_widget_bindings.dart';
import 'package:example/features/demo_add_card_widget/demo_add_card_widget_page.dart';
import 'package:example/features/demo_features/demo_features_bindings.dart';
import 'package:example/features/demo_features/demo_features_page.dart';
import 'package:example/features/demo_payment_widget/demo_payment_widget_bindings.dart';
import 'package:example/features/demo_payment_widget/demo_payment_widget_page.dart';
import 'package:example/features/demo_terms_and_conditions/demo_terms_and_conditions_bindings.dart';
import 'package:example/features/demo_terms_and_conditions/demo_terms_and_conditions_page.dart';
import 'package:example/features/demo_theme/demo_theme_bindings.dart';
import 'package:example/features/demo_theme/demo_theme_page.dart';
import 'package:example/features/demo_web_payments_secure/demo_web_payments_secure_bindings.dart';
import 'package:example/features/demo_web_payments_secure/demo_web_payments_secure_page.dart';
import 'package:example/features/environments/environments_bindings.dart';
import 'package:example/features/environments/environments_page.dart';
import 'package:example/features/environments_create/environments_create_bindings.dart';
import 'package:example/features/environments_create/environments_create_page.dart';
import 'package:example/features/example/features/checkout/example_checkout_bindings.dart';
import 'package:example/features/example/features/checkout/example_checkout_page.dart';
import 'package:example/features/example/features/method/example_method_bindings.dart';
import 'package:example/features/example/features/method/example_method_page.dart';
import 'package:example/features/example/features/order/example_order_bindings.dart';
import 'package:example/features/example/features/order/example_order_page.dart';
import 'package:example/features/example/features/products/example_products_bindings.dart';
import 'package:example/features/example/features/products/example_products_page.dart';
import 'package:example/features/example/features/test_cards/example_test_cards_bindings.dart';
import 'package:example/features/example/features/test_cards/example_test_cards_page.dart';

abstract class Navigation {
  static final pages = [
    GetPage(
      name: Routes.demoAddCardWidget,
      page: () => const DemoAddCardWidgetPage(),
      binding: DemoAddCardWidgetBindings(),
    ),
    GetPage(
      name: Routes.demoFeatures,
      page: () => const DemoFeaturesPage(),
      binding: DemoFeaturesBindings(),
    ),
    GetPage(
      name: Routes.demoPaymentWidget,
      page: () => const DemoPaymentWidgetPage(),
      binding: DemoPaymentWidgetBindings(),
    ),
    GetPage(
      name: Routes.demoTermsAndConditions,
      page: () => const DemoTermsAndConditionsPage(),
      binding: DemoTermsAndConditionsBindings(),
    ),
    GetPage(
      name: Routes.demoTheme,
      page: () => const DemoThemePage(),
      binding: DemoThemeBindings(),
    ),
    GetPage(
      name: Routes.demoWebPaymentsSecure,
      page: () => const DemoWebPaymentsSecurePage(),
      binding: DemoWebPaymentsSecureBindings(),
    ),
    GetPage(
      name: Routes.environments,
      page: () => const EnvironmentsPage(),
      binding: EnvironmentsBindings(),
    ),
    GetPage(
      name: Routes.environmentsCreate,
      page: () => const EnvironmentsCreatePage(),
      binding: EnvironmentsCreateBindings(),
    ),
    GetPage(
      name: Routes.exampleCheckout,
      page: () => const ExampleCheckoutPage(),
      binding: ExampleCheckoutBindings(),
    ),
    GetPage(
      name: Routes.exampleMethod,
      page: () => const ExampleMethodPage(),
      binding: ExampleMethodBindings(),
    ),
    GetPage(
      name: Routes.exampleOrder,
      page: () => const ExampleOrderPage(),
      binding: ExampleOrderBindings(),
    ),
    GetPage(
      name: Routes.exampleProducts,
      page: () => const ExampleProductsPage(),
      binding: ExampleProductsBindings(),
    ),
    GetPage(
      name: Routes.exampleTestCards,
      page: () => const ExampleTestCardsPage(),
      binding: ExampleTestCardsBindings(),
    ),
  ];
}
