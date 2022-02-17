// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBCharacterAdapter extends TypeAdapter<DBCharacter> {
  @override
  final int typeId = 1;

  @override
  DBCharacter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBCharacter(
      id: fields[0] as int,
      name: fields[1] as String,
      status: fields[2] as String,
      species: fields[3] as String,
      type: fields[4] as String,
      gender: fields[5] as String,
      origin: fields[6] as String,
      originName: fields[7] as String,
      location: fields[8] as String,
      locationName: fields[9] as String,
      image: fields[10] as String,
      episodes: (fields[11] as List).cast<int>(),
      created: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DBCharacter obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.species)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.origin)
      ..writeByte(7)
      ..write(obj.originName)
      ..writeByte(8)
      ..write(obj.location)
      ..writeByte(9)
      ..write(obj.locationName)
      ..writeByte(10)
      ..write(obj.image)
      ..writeByte(11)
      ..write(obj.episodes)
      ..writeByte(12)
      ..write(obj.created);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBCharacterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
