import 'package:json_annotation/json_annotation.dart';

enum GrantType {
  @JsonValue('client_credentials')
  clientCredentials,

  @JsonValue('trusted_merchant')
  trustedMerchant,
}

extension GrantTypeExt on GrantType {
  String get key {
    switch (this) {
      case GrantType.clientCredentials:
        return 'client_credentials';
      case GrantType.trustedMerchant:
        return 'trusted_merchant';
    }
  }
}
