import 'package:rick_morty_flutter/src/models/database/character.dart';
import 'package:rick_morty_flutter/src/models/domain/character.dart';
import 'package:rick_morty_flutter/src/models/network/network_character.dart';

extension CharacterMapper on Character {
  static Character fromDB(DBCharacter character) {
    return Character(
      character.id,
      character.name,
      character.status,
      character.species,
      character.type,
      character.gender,
      character.image,
      character.originName,
      character.origin,
      character.locationName,
      character.location,
      character.created,
    );
  }

  static Character fromNetwork(NetworkCharacter character) {
    return Character(
      character.id,
      character.name,
      character.status,
      character.species,
      character.type,
      character.gender,
      character.image,
      character.origin.name,
      '0',
      character.location.name,
      '0',
      character.created,
    );
  }

  static DBCharacter toDBCharacter(Character character, String originName,
      int originId, String locationName, int locationId, List<int> episodeIds) {
    return DBCharacter(
      id: character.id,
      name: character.name,
      status: character.status,
      species: character.species,
      type: character.type,
      gender: character.gender,
      origin: originId.toString(),
      originName: originName,
      location: locationId.toString(),
      locationName: locationName,
      image: character.image,
      episodes: episodeIds,
      created: character.created,
    );
  }
}
