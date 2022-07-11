import 'network_client_status.dart';
import 'network_client_status_code.dart';

class NetworkClientError extends Error {
  final NetworkClientStatusCode statusCode;
  final String codeLiteral;
  final String code;

  NetworkClientError({
    required this.statusCode,
    required this.codeLiteral,
    required this.code,
  });

  factory NetworkClientError.fromStatus(NetworkClientStatus status) {
    return NetworkClientError(
      statusCode: status.statusCode,
      codeLiteral: status.codeLiteral,
      code: status.code,
    );
  }

  @override
  String toString() => '[$runtimeType statusCode: $statusCode, codeLiteral: $codeLiteral, code: $code';
}
