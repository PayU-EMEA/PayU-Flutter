import 'package:json_annotation/json_annotation.dart';

enum PayMethodType {
  @JsonValue('BLIK')
  blik,

  @JsonValue('BLIK_TOKEN')
  blikToken,

  @JsonValue('CARD_TOKEN')
  cardToken,

  @JsonValue('INSTALLMENTS')
  installmenst,

  @JsonValue('PBL')
  pbl,
}
