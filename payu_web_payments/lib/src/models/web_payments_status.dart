// Missing statues, which are not supported by SDK yet
// EXTERNAL_BROWSER,
// SSL_VALIDATION_ERROR

enum WebPaymentsStatus {
  /// Successful transaction
  success,

  /// Transaction failed (e.g. timeout)
  failure,

  /// Transaction cancelled by user
  cancelled,

  /// Transaction needs to be confirmed by 3DS
  continue3DS,

  /// Transaction needs to be confirmed by CVV code
  continueCvv,

  /// Transaction will be handled in mobile bank app
  externalApplication,
}
