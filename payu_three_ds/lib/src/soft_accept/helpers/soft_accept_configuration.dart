import 'package:payu_core/payu_core.dart';

import 'soft_accept_constants.dart';

class SoftAcceptConfiguration {
  final String origin;
  final String channelName;

  const SoftAcceptConfiguration._({
    required this.origin,
    required this.channelName,
  });

  factory SoftAcceptConfiguration.environment(Environment environment) {
    switch (environment) {
      case Environment.production:
        return const SoftAcceptConfiguration._(
          origin: 'https://secure.payu.com',
          channelName: SoftAcceptConstants.javascriptChannelName,
        );

      case Environment.sandbox:
        return const SoftAcceptConfiguration._(
          origin: 'https://merch-prod.snd.payu.com',
          channelName: SoftAcceptConstants.javascriptChannelName,
        );
      case Environment.sandboxBeta:
        return const SoftAcceptConfiguration._(
          origin: 'https://secure.sndbeta.payu.com/',
          channelName: SoftAcceptConstants.javascriptChannelName,
        );
    }
  }
}
