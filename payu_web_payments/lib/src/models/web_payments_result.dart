import 'package:payu_web_payments/src/models/web_payments_status.dart';

class WebPaymentsResult {
  final WebPaymentsStatus status;
  final String? uri;

  const WebPaymentsResult({required this.status, required this.uri});

  @override
  String toString() => '[$runtimeType]: $status, uri: $uri';

  @override
  int get hashCode => Object.hashAll([status, uri]);

  @override
  bool operator ==(Object other) => other is WebPaymentsResult && other.status == status && other.uri == uri;
}
