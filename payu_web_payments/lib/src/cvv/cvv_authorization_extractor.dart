class CVVAuthorizationExtractor {
  String? extractRefReqId(String redirectUri) {
    const refReqIdKey = 'refReqId';
    final uri = Uri.parse(redirectUri);
    return uri.queryParameters[refReqIdKey];
  }
}
