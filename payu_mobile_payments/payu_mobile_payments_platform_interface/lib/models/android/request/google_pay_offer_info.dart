import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_offer_detail.dart';

class GooglePayOfferInfo {
  final List<GooglePayOfferDetail> offers;

  const GooglePayOfferInfo({
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
