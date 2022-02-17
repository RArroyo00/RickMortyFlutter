import 'dart:math';

import 'package:hive/hive.dart';
import 'package:rick_morty_flutter/src/models/database/character.dart';
import 'package:rick_morty_flutter/src/models/domain/mappers/character_mappers.dart';
import 'package:rick_morty_flutter/src/providers/data_provider.dart';
import 'package:rick_morty_flutter/src/providers/database_data_provider.dart';

class DatabaseDataProviderImpl extends DataProvider with DBDataProvider {
  DatabaseDataProviderImpl._internal();

  static final DatabaseDataProviderImpl _instance =
      DatabaseDataProviderImpl._internal();

  factory DatabaseDataProviderImpl() {
    return _instance;
  }

  final String _networkInfoBox = "NetworkInfo";
  final String _lastVisitedcharactersPage = "LastVisitedCharactersPage";
  final String _characterPages = "CharacterPages";
  final String _charactersCount = "CharactersCount";
  Future<Box> _getBox<T>(BoxType boxType) async {
    return await Hive.openBox<T>(boxType.name);
  }

  putCharacter(Character character) async {
    Box box = await _getBox(BoxType.characterBox);
    box.put(
      character.id,
      CharacterMapper.toDBCharacter(character, character.originName, -1,
          character.locationName, -1, List.empty()),
    );
  }

  putCharacters(List<Character> characters) async {
    Box box = await _getBox(BoxType.characterBox);
    Map<dynamic, DBCharacter> characterMap = {
      for (var character in characters)
        character.id: CharacterMapper.toDBCharacter(character,
            character.originName, -1, character.locationName, -1, List.empty())
    };
    box.putAll(characterMap);
  }

  @override
  Future<Character> getCharacter(int characterId) async {
    Box box = await _getBox(BoxType.characterBox);
    DBCharacter character =
        box.values.where((element) => element.id == characterId).first;
    return Future<Character>.value(CharacterMapper.fromDB(character));
  }

  @override
  Future<List<Character>> getCharacters(List<int> characterIds) async {
    Box box = await _getBox(BoxType.characterBox);
    Iterable<Character> characters = box.values
        .where((element) => characterIds.contains(element.id))
        .map((e) => CharacterMapper.fromDB(e));
    return Future<List<Character>>.value(characters.toList());
  }

  Future<List<Character>> getAllCharacters() async {
    Box box = await _getBox(BoxType.characterBox);
    box.keys.map((e) => print("key $e"));
    Iterable<Character> characters =
        box.values.map((e) => CharacterMapper.fromDB(e));
    return Future<List<Character>>.value(characters.toList());
  }

  @override
  Future<Episode> getEpisode(int episodeId) {
    // TODO: implement getEpisode
    throw UnimplementedError();
  }

  @override
  Future<List<Episode>> getEpisodes(List<int> episodeIds) {
    // TODO: implement getEpisodes
    throw UnimplementedError();
  }

  @override
  Future<Location> getLocation(int locationId) {
    // TODO: implement getLocation
    throw UnimplementedError();
  }

  @override
  Future<List<Character>> getLocations(List<int> locationIds) {
    // TODO: implement getLocations
    throw UnimplementedError();
  }

  Future<Box<dynamic>> _getNetworkInfoBox() async {
    return await Hive.openBox(_networkInfoBox);
  }

  @override
  Future<int> getLastVisitedCharacterPage() async {
    Box box = await _getNetworkInfoBox();
    return box.get(_lastVisitedcharactersPage, defaultValue: 0);
  }

  @override
  Future<int> getCharactersCount() async {
    Box box = await _getNetworkInfoBox();
    return box.get(_charactersCount, defaultValue: 0);
  }

  @override
  Future<void> setLastVisitedCharacterPage(int characterPage) async {
    int lastPage = await getLastVisitedCharacterPage();
    if (characterPage > lastPage) {
      Box box = await _getNetworkInfoBox();
      return box.put(_lastVisitedcharactersPage, characterPage);
    }
  }

  @override
  Future<void> setCharacterNetworkInfo(
      int charactersCount, int characterPages) async {
    int dbCharactersCount = await getCharactersCount();
    if (charactersCount != dbCharactersCount) {
      Box box = await _getNetworkInfoBox();
      Map dataMap = {
        _characterPages: characterPages,
        _charactersCount: max(charactersCount, dbCharactersCount)
      };
      return await box.putAll(dataMap);
    }
  }
}

enum BoxType { characterBox, episodeBox, locationBox }
