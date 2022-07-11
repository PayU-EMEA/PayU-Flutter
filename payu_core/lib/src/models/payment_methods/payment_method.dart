import '../brand_image_provider.dart';

abstract class PaymentMethod {
  bool get enabled;
  BrandImageProvider get brandImageProvider;
  String get hash;
  String get name;
  String? get description;
}
