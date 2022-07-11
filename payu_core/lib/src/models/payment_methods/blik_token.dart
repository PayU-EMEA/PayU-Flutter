import '../brand_image_provider.dart';
import 'payment_method.dart';

class BlikToken implements PaymentMethod {
  @override
  bool get enabled => true;

  @override
  BrandImageProvider get brandImageProvider => BrandImageProvider.uri(brandImageUrl);

  @override
  String get hash => value;

  @override
  String get name => 'BLIK';

  @override
  String? get description => null;

  final String brandImageUrl;
  final String type;
  final String value;

  const BlikToken({
    required this.brandImageUrl,
    required this.type,
    required this.value,
  });

  factory BlikToken.fromJson(Map<String, dynamic> json) {
    return BlikToken(
      brandImageUrl: json['brandImageUrl'],
      type: json['type'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brandImageUrl': brandImageUrl,
      'type': type,
      'value': value,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
