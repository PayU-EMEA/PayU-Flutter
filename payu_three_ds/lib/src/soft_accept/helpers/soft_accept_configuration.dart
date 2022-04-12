import 'package:payu_core/payu_core.dart';

import 'soft_accept_constants.dart';

class SoftAcceptConfiguration {
  final String origin;
  final String channelName;

  const SoftAcceptConfiguration._({
    required this.origin,
    this.channelName = SoftAcceptConstants.javascriptChannelName,
  });

  factory SoftAcceptConfiguration.environment(Environment environment) {
    switch (environment) {
      case Environment.production:
        return const SoftAcceptConfiguration._(
          origin: 'https://secure.payu.com',
        );

      case Environment.sandbox:
        return const SoftAcceptConfiguration._(
          origin: 'https://merch-prod.snd.payu.com',
        );
    }
  }
}
