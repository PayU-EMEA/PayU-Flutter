import 'package:json_annotation/json_annotation.dart';

enum PaymentMethodStatus {
  @JsonValue('ENABLED')
  enabled,

  @JsonValue('DISABLED')
  disabled,
}
