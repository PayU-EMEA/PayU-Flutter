import '../brand_image_provider.dart';
import 'payment_method.dart';
import 'payment_method_value.dart';

class BlikCode implements PaymentMethod {
  @override
  bool get enabled => true;

  // TODO: - Change endpoint to `static`
  @override
  BrandImageProvider get brandImageProvider =>
      BrandImageProvider.uri('https://static.payu.com/images/mobile/logos/pbl_blik.png');

  @override
  String get hash => PaymentMethodValue.blikCode;

  @override
  String get name => 'BLIK';

  @override
  String? get description => null;

  const BlikCode();

  @override
  String toString() => '[$runtimeType]';
}
