import 'package:payu_core/payu_core.dart';

enum PaymentCardProviderType { maestro, mastercard, visa }

class PaymentCardProvider {
  final BrandImageProvider brandImageProvider;
  final PaymentCardProviderType type;
  final String scheme;

  const PaymentCardProvider._({
    required this.brandImageProvider,
    required this.type,
    required this.scheme,
  });

  factory PaymentCardProvider.maestro() {
    return PaymentCardProvider._(
      brandImageProvider: BrandImageProvider.maestro(),
      type: PaymentCardProviderType.maestro,
      scheme: 'MC',
    );
  }
  factory PaymentCardProvider.mastercard() {
    return PaymentCardProvider._(
      brandImageProvider: BrandImageProvider.mastercard(),
      type: PaymentCardProviderType.mastercard,
      scheme: 'MC',
    );
  }
  factory PaymentCardProvider.visa() {
    return PaymentCardProvider._(
      brandImageProvider: BrandImageProvider.visa(),
      type: PaymentCardProviderType.visa,
      scheme: 'VS',
    );
  }

  static List<PaymentCardProvider> all() {
    return [
      PaymentCardProvider.maestro(),
      PaymentCardProvider.mastercard(),
      PaymentCardProvider.visa(),
    ];
  }

  @override
  String toString() => '[$runtimeType]: $scheme';

  @override
  int get hashCode => Object.hashAll([type, scheme]);

  @override
  bool operator ==(Object other) => other is PaymentCardProvider && other.scheme == scheme && other.type == type;
}
