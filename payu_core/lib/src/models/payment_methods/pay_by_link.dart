import '../brand_image_provider.dart';
import 'payment_method.dart';

enum PayByLinkStatus {
  enabled,
  disabled,
  temporaryDisabled,
  unknown,
}

extension PayByLinkStatusFromExt on PayByLinkStatus {
  static PayByLinkStatus fromValue(String value) {
    switch (value) {
      case 'ENABLED':
        return PayByLinkStatus.enabled;
      case 'DISABLED':
        return PayByLinkStatus.disabled;
      case 'TEMPORARY_DISABLED':
        return PayByLinkStatus.temporaryDisabled;
      default:
        return PayByLinkStatus.unknown;
    }
  }
}

extension PayByLinkStatusToExt on PayByLinkStatus {
  String get value {
    switch (this) {
      case PayByLinkStatus.enabled:
        return 'ENABLED';
      case PayByLinkStatus.disabled:
        return 'DISABLED';
      case PayByLinkStatus.temporaryDisabled:
        return 'TEMPORARY_DISABLED';
      default:
        return 'UNKNOWN';
    }
  }
}

class PayByLink implements PaymentMethod {
  @override
  BrandImageProvider get brandImageProvider => BrandImageProvider.uri(brandImageUrl);

  @override
  bool get enabled => status == PayByLinkStatus.enabled;

  @override
  String get hash => value;

  @override
  String? get description => null;

  @override
  final String name;
  final String brandImageUrl;
  final PayByLinkStatus status;
  final String value;

  const PayByLink({
    required this.brandImageUrl,
    required this.name,
    required this.status,
    required this.value,
  });

  factory PayByLink.fromJson(Map<String, dynamic> json) {
    return PayByLink(
      brandImageUrl: json['brandImageUrl'],
      name: json['name'],
      status: PayByLinkStatusFromExt.fromValue(json['status']),
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'brandImageUrl': brandImageUrl,
      'status': status.value,
      'value': value,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
