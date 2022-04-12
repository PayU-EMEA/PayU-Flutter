mixin PaymentWidgetServiceDelegate {
  String? blikAuthorizationCode();
  bool isBlikAuthorizationCodeRequired();
}

class PaymentWidgetService {
  PaymentWidgetServiceDelegate? delegate;

  String? blikAuthorizationCode() {
    return delegate?.blikAuthorizationCode();
  }

  bool isBlikAuthorizationCodeRequired() {
    return delegate?.isBlikAuthorizationCodeRequired() ?? false;
  }
}
