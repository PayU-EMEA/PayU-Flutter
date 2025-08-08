import 'package:example/data/models/environment.dart';

abstract class BackendConstants {
  static const buyerEmail = 'email@payu.com';
  static const buyerPhone = '+48123456789';
  static const buyerFirstName = 'Flutter';
  static const buyerLastName = 'Developer';
  static const buyerLanguage = 'pl';
  static const buyerExtCustomerId = '214142532';

  static const deliveryRecipientName = 'Recipient';
  static const deliveryRecipientEmail = 'Testowy';
  static const deliveryRecipientPhone = '+48 123 456 789';
  static const deliveryAddressId = '44';
  static const deliveryStreet = 'Grunwaldzka 186';
  static const deliveryPostalBox = 'Poznań';
  static const deliveryPostalCode = '60-166';
  static const deliveryCity = 'Poznań';
  static const deliveryState = 'woj. wielkopolskie';
  static const deliveryCountryCode = 'PL';
  static const deliveryName = 'PayU';

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
