enum NetworkClientExceptionType { missingEnvironment, missingPOS }

class NetworkClientException implements Exception {
  final NetworkClientExceptionType type;

  const NetworkClientException(this.type);

  factory NetworkClientException.missingEnvironment() {
    return const NetworkClientException(NetworkClientExceptionType.missingEnvironment);
  }

  factory NetworkClientException.missingPOS() {
    return const NetworkClientException(NetworkClientExceptionType.missingPOS);
  }

  String get message {
    switch (type) {
      case NetworkClientExceptionType.missingEnvironment:
        return '`environment` is not set. Please call `Payu.environment = ...` before';
      case NetworkClientExceptionType.missingPOS:
        return '`pos` is not set. Please call `Payu.pos = ...` before';
    }
  }

  @override
  String toString() => '[$runtimeType]: $message';
}
