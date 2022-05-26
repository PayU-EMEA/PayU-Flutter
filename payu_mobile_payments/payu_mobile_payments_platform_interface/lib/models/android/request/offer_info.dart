import 'package:payu_mobile_payments_platform_interface/models/android/request/offer_detail.dart';

class OfferInfo {
  final List<OfferDetail> offers;

  const OfferInfo({
    required this.offers,
  });

  Map<String, dynamic> toJson() {
    return {
      'offers': offers.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
