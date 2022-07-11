enum NetworkClientStatusCode { success, error, unknown }

extension NetworkClientStatusCodeFromExt on NetworkClientStatusCode {
  static NetworkClientStatusCode fromValue(String value) {
    switch (value) {
      case 'SUCCESS':
        return NetworkClientStatusCode.success;
      case 'ERROR':
        return NetworkClientStatusCode.error;
      default:
        return NetworkClientStatusCode.unknown;
    }
  }
}

extension NetworkClientStatusCodeToExt on NetworkClientStatusCode {
  String get value {
    switch (this) {
      case NetworkClientStatusCode.success:
        return 'SUCCESS';
      case NetworkClientStatusCode.error:
        return 'ERROR';
      case NetworkClientStatusCode.unknown:
        return 'UNKNOWN';
    }
  }
}
