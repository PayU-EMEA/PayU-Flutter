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
  String? get description {
    final base = '$cardExpirationMonth/$cardExpirationYear';
    final installments = cardInstallments;
    if (installments == null) return base;
    return '$base, ${installments.numberLabel}';
  }

  final String brandImageUrl;
  final String cardExpirationMonth;
  final String cardExpirationYear;
  final String cardNumberMasked;
  final String? cardScheme;
  final bool preferred;
  final CardTokenStatus status;
  final String value;
  final CardTokenInstallments? cardInstallments;

  const CardToken({
    required this.brandImageUrl,
    required this.cardExpirationMonth,
    required this.cardExpirationYear,
    required this.cardNumberMasked,
    required this.cardScheme,
    required this.preferred,
    required this.status,
    required this.value,
    this.cardInstallments,
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
      cardInstallments: json['cardInstallments'] != null
          ? CardTokenInstallments.fromJson(
              json['cardInstallments'] as Map<String, dynamic>,
            )
          : null,
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
      if (cardInstallments != null) 'cardInstallments': cardInstallments,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}

class CardTokenInstallments {
  final String provider;
  final int number;
  final String numberLabel;

  const CardTokenInstallments({
    required this.provider,
    required this.number,
    required this.numberLabel,
  });

  factory CardTokenInstallments.fromJson(Map<String, dynamic> json) {
    return CardTokenInstallments(
      provider: json['provider'] as String,
      number: json['number'] as int,
      numberLabel: json['numberLabel'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'provider': provider,
      'number': number,
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
