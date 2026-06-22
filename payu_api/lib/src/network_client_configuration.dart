import 'package:payu_core/payu_core.dart';

class NetworkClientConfiguration {
  final String baseUrl;

  NetworkClientConfiguration._({required this.baseUrl});

  factory NetworkClientConfiguration.environment(Environment environment) {
    switch (environment) {
      case Environment.production:
        return NetworkClientConfiguration._(
          baseUrl: 'https://mobilesdk.platnosci.pl',
        );

      case Environment.sandbox:
        return NetworkClientConfiguration._(
          baseUrl: 'https://mobilesdk.snd.platnosci.pl',
        );
      case Environment.sandboxBeta:
        return NetworkClientConfiguration._(
          baseUrl: 'https://secure.sndbeta.payu.com/',
        );
    }
  }
}
