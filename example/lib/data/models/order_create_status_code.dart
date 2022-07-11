import 'package:json_annotation/json_annotation.dart';

enum OrderCreateStatusCode {
  @JsonValue('SUCCESS')
  success,

  @JsonValue('WARNING_CONTINUE_REDIRECT')
  warningContinueRedirect,

  @JsonValue('WARNING_CONTINUE_3DS')
  warningContinue3DS,

  @JsonValue('WARNING_CONTINUE_CVV')
  warningContinueCVV,
}
