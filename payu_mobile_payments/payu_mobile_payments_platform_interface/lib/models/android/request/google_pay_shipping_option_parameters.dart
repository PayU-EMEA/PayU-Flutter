import 'google_pay_selection_option.dart';

class GooglePayShippingOptionParameters {
  final List<GooglePaySelectionOption> shippingOptions;
  final String? defaultSelectedOptionId;

  const GooglePayShippingOptionParameters({
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
