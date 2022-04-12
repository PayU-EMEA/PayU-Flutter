class SoftAcceptUriModifier {
  Uri modify(String redirectUri) {
    final originalUri = Uri.parse(redirectUri);
    final queryParameters = Map<String, String>.from(originalUri.queryParameters);
    queryParameters['sendCreq'] = 'false';
    return originalUri.replace(queryParameters: queryParameters);
  }
}
