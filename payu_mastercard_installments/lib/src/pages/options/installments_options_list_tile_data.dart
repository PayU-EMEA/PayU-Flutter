import 'package:payu_mastercard_installments/payu_mastercard_installments.dart';

class InstallmentsOptionsListTileData {
  final InstallmentOption option;

  final String title;
  final String? prefix;
  final String subtitle;
  final String total;

  const InstallmentsOptionsListTileData({
    required this.option,
    required this.title,
    required this.prefix,
    required this.subtitle,
    required this.total,
  });
}
