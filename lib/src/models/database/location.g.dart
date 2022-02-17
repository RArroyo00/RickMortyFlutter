// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBLocationAdapter extends TypeAdapter<DBLocation> {
  @override
  final int typeId = 3;

  @override
  DBLocation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBLocation(
      id: fields[0] as int,
      name: fields[1] as String,
      type: fields[2] as String?,
      dimension: fields[3] as String,
      residents: (fields[4] as List).cast<int>(),
      created: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DBLocation obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.dimension)
      ..writeByte(4)
      ..write(obj.residents)
      ..writeByte(5)
      ..write(obj.created);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBLocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
