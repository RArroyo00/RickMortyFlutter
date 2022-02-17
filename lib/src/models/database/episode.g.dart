// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBEpisodeAdapter extends TypeAdapter<DBEpisode> {
  @override
  final int typeId = 2;

  @override
  DBEpisode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBEpisode(
      id: fields[0] as int,
      name: fields[1] as String,
      airDate: fields[2] as String,
      episodeCode: fields[3] as String,
      characters: (fields[4] as List).cast<int>(),
      created: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DBEpisode obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.airDate)
      ..writeByte(3)
      ..write(obj.episodeCode)
      ..writeByte(4)
      ..write(obj.characters)
      ..writeByte(5)
      ..write(obj.created);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBEpisodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
