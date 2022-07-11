class SoftAcceptQueryParameterExtractor {
  String? extractAuthenticationId(String uri) {
    return _extractQueryParameter(uri, 'authenticationId');
  }

  String? _extractQueryParameter(String uri, String queryParameterKey) {
    return Uri.parse(uri).queryParameters[queryParameterKey];
  }
}
