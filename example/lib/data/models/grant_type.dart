import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:example/core/database_type_id.dart';

part 'grant_type.g.dart';

@HiveType(typeId: DatabaseTypeId.grantType)
enum GrantType {
  @HiveField(0)
  @JsonValue('client_credentials')
  clientCredentials,

  @HiveField(1)
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
