import 'package:payu_core/payu_core.dart';

class NetworkClientConfiguration {
  final String baseUrl;

  NetworkClientConfiguration._({required this.baseUrl});

  factory NetworkClientConfiguration.environment(Environment environment) {
    switch (environment) {
      case Environment.production:
        return NetworkClientConfiguration._(
          baseUrl: 'https://mobilesdk.secure.payu.com',
        );

      case Environment.sandbox:
        return NetworkClientConfiguration._(
          baseUrl: 'https://mobilesdk.snd.payu.com',
        );
      case Environment.sandboxBeta:
        return NetworkClientConfiguration._(
          baseUrl: 'https://secure.sndbeta.payu.com/',
        );
    }
  }
}
