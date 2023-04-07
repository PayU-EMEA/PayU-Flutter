import 'package:example/data/models/environment.dart';

abstract class BackendConstants {
  static const buyerEmail = 'objectivitydevices@gmail.com';
  static const buyerPhone = '+48123456789';
  static const buyerFirstName = 'Flutter';
  static const buyerLastName = 'Developer';
  static const buyerLanguage = 'pl';
  static const buyerExtCustomerId = '214142532';

  static const orderCustomerIp = '127.0.0.1';
  static const orderDescription = 'Flutter Demo Application';

  static String apiBaseUrl(Environment environment) {
    switch (environment) {
      case Environment.production:
        return 'https://secure.payu.com/';
      case Environment.sandbox:
        return 'https://secure.snd.payu.com/';
      case Environment.sandboxBeta:
        return 'https://secure.sndbeta.payu.com/';
    }
  }
}
