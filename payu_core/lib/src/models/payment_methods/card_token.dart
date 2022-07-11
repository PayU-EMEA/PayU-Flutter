import '../brand_image_provider.dart';
import 'payment_method.dart';

enum CardTokenStatus { active, expired }

class CardToken implements PaymentMethod {
  @override
  BrandImageProvider get brandImageProvider => BrandImageProvider.uri(brandImageUrl);

  @override
  bool get enabled => status == CardTokenStatus.active;

  @override
  String get hash => value;

  @override
  String get name => cardNumberMasked;

  @override
  String? get description => '$cardExpirationMonth/$cardExpirationYear';

  final String brandImageUrl;
  final String cardExpirationMonth;
  final String cardExpirationYear;
  final String cardNumberMasked;
  final String? cardScheme;
  final bool preferred;
  final CardTokenStatus status;
  final String value;

  const CardToken({
    required this.brandImageUrl,
    required this.cardExpirationMonth,
    required this.cardExpirationYear,
    required this.cardNumberMasked,
    required this.cardScheme,
    required this.preferred,
    required this.status,
    required this.value,
  });

  factory CardToken.fromJson(Map<String, dynamic> json) {
    return CardToken(
      brandImageUrl: json['brandImageUrl'],
      cardExpirationMonth: json['cardExpirationMonth'].toString(),
      cardExpirationYear: json['cardExpirationYear'].toString(),
      cardNumberMasked: json['cardNumberMasked'],
      cardScheme: json['cardScheme'],
      preferred: json['preferred'],
      status: CardTokenStatusFromExt.fromValue(json['status']),
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brandImageUrl': brandImageUrl,
      'cardExpirationMonth': cardExpirationMonth,
      'cardExpirationYear': cardExpirationYear,
      'cardNumberMasked': cardNumberMasked,
      'cardScheme': cardScheme,
      'preferred': preferred,
      'status': status.value,
      'value': value,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}

extension CardTokenStatusFromExt on CardTokenStatus {
  static CardTokenStatus fromValue(String value) {
    switch (value) {
      case 'ACTIVE':
        return CardTokenStatus.active;
      case 'EXPIRED':
        return CardTokenStatus.expired;
      default:
        return CardTokenStatus.expired;
    }
  }
}

extension CardTokenStatusToExt on CardTokenStatus {
  String get value {
    switch (this) {
      case CardTokenStatus.active:
        return 'ACTIVE';
      case CardTokenStatus.expired:
        return 'EXPIRED';
    }
  }
}
