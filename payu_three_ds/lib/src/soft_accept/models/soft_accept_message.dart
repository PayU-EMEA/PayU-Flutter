/// The iframe may post messages to its parent window with the following values in message.data property
enum SoftAcceptMessage {
  /// reveal the iframe if it was hidden.
  /// May occur twice in case of 3DS 2 Challenge followed by CVV form.
  displayFrame,

  /// challenge was successful, close the iframe. Wait for authorization
  /// result before showing any information about payment status.
  /// To obtain the result, wait for notification or retrieve order details
  authenticationSuccessful,

  /// challenge was canceled and the payment declined, close the iframe.
  /// Wait for authorization result before showing anyinformation about payment status.
  /// To obtain the result, wait for notification or retrieve order details
  authenticationCanceled,

  // no authentication was required, close the iframe
  authenticationNotRequired,
}

extension SoftAcceptMessageFromExt on SoftAcceptMessage {
  static SoftAcceptMessage fromValue(String value) {
    switch (value) {
      case 'DISPLAY_FRAME':
        return SoftAcceptMessage.displayFrame;
      case 'AUTHENTICATION_SUCCESSFUL':
        return SoftAcceptMessage.authenticationSuccessful;
      case 'AUTHENTICATION_CANCELED':
        return SoftAcceptMessage.authenticationCanceled;
      case 'AUTHENTICATION_NOT_REQUIRED':
        return SoftAcceptMessage.authenticationNotRequired;
      default:
        return SoftAcceptMessage.authenticationCanceled;
    }
  }
}

extension SoftAcceptMessageToExt on SoftAcceptMessage {
  String get value {
    switch (this) {
      case SoftAcceptMessage.displayFrame:
        return 'DISPLAY_FRAME';
      case SoftAcceptMessage.authenticationSuccessful:
        return 'AUTHENTICATION_SUCCESSFUL';
      case SoftAcceptMessage.authenticationCanceled:
        return 'AUTHENTICATION_CANCELED';
      case SoftAcceptMessage.authenticationNotRequired:
        return 'AUTHENTICATION_NOT_REQUIRED';
    }
  }
}
