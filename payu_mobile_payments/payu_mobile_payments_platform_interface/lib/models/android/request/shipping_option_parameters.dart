import 'package:payu_mobile_payments_platform_interface/models/android/request/selection_option.dart';

class ShippingOptionParameters {
  final List<SelectionOption> shippingOptions;
  final String? defaultSelectedOptionId;

  const ShippingOptionParameters({
    required this.shippingOptions,
    this.defaultSelectedOptionId,
  });

  Map<String, dynamic> toJson() {
    return {
      'shippingOptions': shippingOptions.map((e) => e.toJson()).toList(),
      'defaultSelectedOptionId': defaultSelectedOptionId,
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
