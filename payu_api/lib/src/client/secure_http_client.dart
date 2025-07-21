import 'dart:io';

import 'package:flutter/services.dart';

import 'package:http/io_client.dart';

class SecureHttpClient extends IOClient {
  final HttpClient httpClient;

  SecureHttpClient(this.httpClient) : super(httpClient);

  factory SecureHttpClient.create() {
    final context = _makeGlobalSecurityContext();
    final httpClient = HttpClient(context: context);
    httpClient.badCertificateCallback = (cert, host, port) => false;
    return SecureHttpClient(httpClient);
  }

  static SecurityContext _makeGlobalSecurityContext() {
    SecurityContext context = SecurityContext(withTrustedRoots: false);
    _setTrustedCertificatesBytes(context, 'packages/payu_api/ssl/entrust.pem');
    _setTrustedCertificatesBytes(context, 'packages/payu_api/ssl/sectigoR46.pem');
    return context;
  }

  static void _setTrustedCertificatesBytes(SecurityContext context, String certificatePath) async {
    try {
      final certificate = await rootBundle.load(certificatePath);
      context.setTrustedCertificatesBytes(certificate.buffer.asInt8List());
    } catch (_) {}
  }
}
