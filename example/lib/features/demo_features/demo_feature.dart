import 'dart:io';

enum DemoFeatureType {
  demoAddCardPage,
  demoAddCardWidget,
  demoApplePay,
  demoGooglePay,
  demoPaymentMethods,
  demoPaymentWidget,
  demoSoftAccept,
  demoTermsAndConditions,
  demoTheme,
  demoWebPaymentsSecure,
  exampleOrder,
}

class DemoFeature {
  final String name;
  final String description;
  final DemoFeatureType type;
  final bool enabled;

  const DemoFeature({
    required this.name,
    required this.description,
    required this.type,
    this.enabled = true,
  });

  static final all = [
    DemoFeature.demoAddCardPage(),
    DemoFeature.demoAddCardWidget(),
    DemoFeature.demoApplePay(),
    DemoFeature.demoGooglePay(),
    DemoFeature.demoPaymentMethods(),
    DemoFeature.demoPaymentWidget(),
    DemoFeature.demoSoftAccept(),
    DemoFeature.demoTermsAndConditions(),
    DemoFeature.demoWebPaymentsSecure(),
    DemoFeature.exampleOrder(),
  ];

  factory DemoFeature.demoAddCardPage() {
    return const DemoFeature(
      name: '[Demo] AddCardPage',
      description: 'Check how to use AddCardPage',
      type: DemoFeatureType.demoAddCardPage,
    );
  }

  factory DemoFeature.demoAddCardWidget() {
    return const DemoFeature(
      name: '[Demo] AddCardWidget',
      description: 'Check how to use AddCardWidget',
      type: DemoFeatureType.demoAddCardWidget,
    );
  }

  factory DemoFeature.demoApplePay() {
    return DemoFeature(
      name: '[Demo] ApplePay',
      description: 'Check how to implement ApplePay',
      type: DemoFeatureType.demoApplePay,
      enabled: Platform.isIOS,
    );
  }

  factory DemoFeature.demoGooglePay() {
    return DemoFeature(
        name: '[Demo] GooglePay',
        description: 'Check how to implement GooglePay',
        type: DemoFeatureType.demoGooglePay,
        enabled: Platform.isAndroid);
  }

  factory DemoFeature.demoPaymentMethods() {
    return const DemoFeature(
      name: '[Demo] PaymentMethodsPage',
      description: 'Check how to implement different payment methods, for ex. Apple Pay / Google Pay, PBL, etc.',
      type: DemoFeatureType.demoPaymentMethods,
    );
  }

  factory DemoFeature.demoPaymentWidget() {
    return const DemoFeature(
      name: '[Demo] PaymentMethodsWidget',
      description: 'Check how to integrate the `PaymentWidget`',
      type: DemoFeatureType.demoPaymentWidget,
    );
  }

  factory DemoFeature.demoSoftAccept() {
    return const DemoFeature(
      name: '[Demo] Soft Accept',
      description: 'Check how to handle the `WARNING_CONTINUE_3DS`',
      type: DemoFeatureType.demoSoftAccept,
    );
  }

  factory DemoFeature.demoTermsAndConditions() {
    return const DemoFeature(
      name: '[Demo] TermsAndConditionsWidget',
      description: 'Check how to use Terms And Conditions Widget',
      type: DemoFeatureType.demoTermsAndConditions,
    );
  }

  factory DemoFeature.demoWebPaymentsSecure() {
    return const DemoFeature(
      name: '[Demo] WebPaymentsRequest (SSL)',
      description: 'Check how do we handle security to web payments urls',
      type: DemoFeatureType.demoWebPaymentsSecure,
    );
  }

  factory DemoFeature.exampleOrder() {
    return const DemoFeature(
      name: 'Example',
      description: 'Check the example flow of how to create an order',
      type: DemoFeatureType.exampleOrder,
    );
  }
}
