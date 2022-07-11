// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environments_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnvironmentsModelAdapter extends TypeAdapter<EnvironmentsModel> {
  @override
  final int typeId = 2;

  @override
  EnvironmentsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnvironmentsModel(
      grantType: fields[0] as GrantType,
      environment: fields[1] as Environment,
      clientId: fields[2] as String,
      clientSecret: fields[3] as String,
      name: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EnvironmentsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.grantType)
      ..writeByte(1)
      ..write(obj.environment)
      ..writeByte(2)
      ..write(obj.clientId)
      ..writeByte(3)
      ..write(obj.clientSecret)
      ..writeByte(4)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnvironmentsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
