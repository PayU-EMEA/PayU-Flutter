// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grant_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GrantTypeAdapter extends TypeAdapter<GrantType> {
  @override
  final int typeId = 3;

  @override
  GrantType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GrantType.clientCredentials;
      case 1:
        return GrantType.trustedMerchant;
      default:
        return GrantType.clientCredentials;
    }
  }

  @override
  void write(BinaryWriter writer, GrantType obj) {
    switch (obj) {
      case GrantType.clientCredentials:
        writer.writeByte(0);
        break;
      case GrantType.trustedMerchant:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GrantTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
