// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnvironmentAdapter extends TypeAdapter<Environment> {
  @override
  final int typeId = 1;

  @override
  Environment read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Environment.production;
      case 1:
        return Environment.sandbox;
      case 2:
        return Environment.sandboxBeta;
      default:
        return Environment.production;
    }
  }

  @override
  void write(BinaryWriter writer, Environment obj) {
    switch (obj) {
      case Environment.production:
        writer.writeByte(0);
        break;
      case Environment.sandbox:
        writer.writeByte(1);
        break;
      case Environment.sandboxBeta:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnvironmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
