import 'package:payu_core/payu_core.dart';
import 'package:payu_translations/payu_translations.dart';
import 'package:payu_ui/payu_ui.dart';

abstract class PaymentMethodsItem {
  bool get enabled;
  String? get hash;
  String get title;
  String? get subtitle;
  BrandImageProvider get brandImageProvider;
  double get brandImageProviderSize;
  PaymentMethod? get paymentMethod;
}

class PaymentMethodsApplePayItem implements PaymentMethodsItem {
  final ApplePay value;

  @override
  final bool enabled;

  @override
  String? get hash => value.hash;

  @override
  final String title;

  @override
  final String? subtitle;

  @override
  final BrandImageProvider brandImageProvider;

  @override
  final double brandImageProviderSize;

  @override
  PaymentMethod? get paymentMethod => value;

  const PaymentMethodsApplePayItem({
    required this.value,
    required this.enabled,
    required this.title,
    required this.subtitle,
    required this.brandImageProvider,
    required this.brandImageProviderSize,
  });

  factory PaymentMethodsApplePayItem.build(ApplePay value) {
    return PaymentMethodsApplePayItem(
      value: value,
      enabled: value.enabled,
      title: value.name,
      subtitle: 'pay_by_phone'.translated(),
      brandImageProvider: value.brandImageProvider,
      brandImageProviderSize: 48,
    );
  }
}

class PaymentMethodsBankTransferItem implements PaymentMethodsItem {
  @override
  final bool enabled;

  @override
  String? get hash => null;

  @override
  final String title;

  @override
  final String? subtitle;

  @override
  final BrandImageProvider brandImageProvider;

  @override
  final double brandImageProviderSize;

  @override
  PaymentMethod? get paymentMethod => null;

  const PaymentMethodsBankTransferItem({
    required this.enabled,
    required this.subtitle,
    required this.title,
    required this.brandImageProvider,
    required this.brandImageProviderSize,
  });

  factory PaymentMethodsBankTransferItem.build(bool enabled) {
    return PaymentMethodsBankTransferItem(
      enabled: enabled,
      title: 'bank_transfer'.translated(),
      subtitle: 'fast_online_transfer'.translated(),
      brandImageProvider: const BrandImageProvider(icon: PayuIcon.send),
      brandImageProviderSize: 24,
    );
  }
}

class PaymentMethodsBlikCodeItem implements PaymentMethodsItem {
  final BlikCode value;

  @override
  final bool enabled;

  @override
  String? get hash => value.hash;

  @override
  final String title;

  @override
  final String? subtitle;

  @override
  final BrandImageProvider brandImageProvider;

  @override
  final double brandImageProviderSize;

  @override
  PaymentMethod? get paymentMethod => value;

  const PaymentMethodsBlikCodeItem({
    required this.value,
    required this.enabled,
    required this.title,
    required this.subtitle,
    required this.brandImageProvider,
    required this.brandImageProviderSize,
  });

  factory PaymentMethodsBlikCodeItem.build(BlikCode value) {
    return PaymentMethodsBlikCodeItem(
      value: value,
      enabled: value.enabled,
      title: value.name,
      subtitle: 'use_code_from_your_bank_app'.translated(),
      brandImageProvider: value.brandImageProvider,
      brandImageProviderSize: 48,
    );
  }
}

class PaymentMethodsBlikTokenItem implements PaymentMethodsItem {
  final BlikToken value;

  @override
  final bool enabled;

  @override
  String? get hash => value.hash;

  @override
  final String title;

  @override
  final String? subtitle;

  @override
  final BrandImageProvider brandImageProvider;

  @override
  final double brandImageProviderSize;

  @override
  PaymentMethod? get paymentMethod => value;

  const PaymentMethodsBlikTokenItem({
    required this.value,
    required this.enabled,
    required this.title,
    required this.subtitle,
    required this.brandImageProvider,
    required this.brandImageProviderSize,
  });

  factory PaymentMethodsBlikTokenItem.build(BlikToken value) {
    return PaymentMethodsBlikTokenItem(
      value: value,
      enabled: value.enabled,
      title: value.name,
      subtitle: 'one_tap_payment'.translated(),
      brandImageProvider: value.brandImageProvider,
      brandImageProviderSize: 48,
    );
  }
}

class PaymentMethodsCardItem implements PaymentMethodsItem {
  @override
  final bool enabled;

  @override
  String? get hash => null;

  @override
  final String title;

  @override
  final String? subtitle;

  @override
  final BrandImageProvider brandImageProvider;

  @override
  final double brandImageProviderSize;

  @override
  PaymentMethod? get paymentMethod => null;

  const PaymentMethodsCardItem({
    required this.enabled,
    required this.subtitle,
    required this.title,
    required this.brandImageProvider,
    required this.brandImageProviderSize,
  });

  factory PaymentMethodsCardItem.build() {
    return PaymentMethodsCardItem(
      enabled: true,
      title: 'card'.translated(),
      subtitle: 'credit_or_debit'.translated(),
      brandImageProvider: const BrandImageProvider(icon: PayuIcon.creditCard),
      brandImageProviderSize: 24,
    );
  }
}

class PaymentMethodsCardTokenItem implements PaymentMethodsItem {
  final CardToken value;

  @override
  final bool enabled;

  @override
  String? get hash => value.hash;

  @override
  final String title;

  @override
  final String? subtitle;

  @override
  final BrandImageProvider brandImageProvider;

  @override
  final double brandImageProviderSize;

  @override
  PaymentMethod? get paymentMethod => value;

  const PaymentMethodsCardTokenItem({
    required this.value,
    required this.enabled,
    required this.title,
    required this.subtitle,
    required this.brandImageProvider,
    required this.brandImageProviderSize,
  });

  factory PaymentMethodsCardTokenItem.build(CardToken value) {
    return PaymentMethodsCardTokenItem(
      value: value,
      enabled: value.enabled,
      title: value.cardNumberMasked,
      subtitle: '${value.cardExpirationMonth}/${value.cardExpirationYear}',
      brandImageProvider: value.brandImageProvider,
      brandImageProviderSize: 48,
    );
  }
}

class PaymentMethodsInstallmentsItem implements PaymentMethodsItem {
  final Installments value;

  @override
  final bool enabled;

  @override
  String? get hash => value.hash;

  @override
  final String title;

  @override
  final String? subtitle;

  @override
  final BrandImageProvider brandImageProvider;

  @override
  final double brandImageProviderSize;

  @override
  PaymentMethod? get paymentMethod => value;

  const PaymentMethodsInstallmentsItem({
    required this.value,
    required this.enabled,
    required this.title,
    required this.subtitle,
    required this.brandImageProvider,
    required this.brandImageProviderSize,
  });

  factory PaymentMethodsInstallmentsItem.build(Installments value) {
    return PaymentMethodsInstallmentsItem(
      value: value,
      enabled: value.enabled,
      title: value.name,
      subtitle: 'decision_in_even_15_minutes'.translated(),
      brandImageProvider: value.brandImageProvider,
      brandImageProviderSize: 48,
    );
  }
}

class PaymentMethodsPayByLinkItem implements PaymentMethodsItem {
  final PayByLink value;

  @override
  final bool enabled;

  @override
  String? get hash => value.hash;

  @override
  final String title;

  @override
  final String? subtitle;

  @override
  final BrandImageProvider brandImageProvider;

  @override
  final double brandImageProviderSize;

  @override
  PaymentMethod? get paymentMethod => value;

  const PaymentMethodsPayByLinkItem({
    required this.value,
    required this.enabled,
    required this.title,
    required this.subtitle,
    required this.brandImageProvider,
    required this.brandImageProviderSize,
  });

  factory PaymentMethodsPayByLinkItem.build(PayByLink value) {
    return PaymentMethodsPayByLinkItem(
      value: value,
      enabled: value.enabled,
      title: value.name,
      subtitle: null,
      brandImageProvider: value.brandImageProvider,
      brandImageProviderSize: 48,
    );
  }
}
