import '../brand_image_provider.dart';
import 'pay_by_link.dart';
import 'payment_method.dart';

class ApplePay implements PaymentMethod {
  @override
  bool get enabled => status == PayByLinkStatus.enabled;

  @override
  BrandImageProvider get brandImageProvider => BrandImageProvider.uri(brandImageUrl);

  @override
  String get hash => value;

  @override
  String? get description => null;

  @override
  final String name;
  final String brandImageUrl;
  final PayByLinkStatus status;
  final String value;

  const ApplePay({
    required this.name,
    required this.brandImageUrl,
    required this.value,
    required this.status,
  });

  factory ApplePay.fromPayByLink(PayByLink value) {
    return ApplePay(
      name: value.name,
      brandImageUrl: value.brandImageUrl,
      value: value.value,
      status: value.status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brandImageUrl': brandImageUrl,
      'value': value,
      'status': status.value,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
