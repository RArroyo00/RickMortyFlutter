import 'package:rick_morty_flutter/src/models/domain/episode.dart';
export 'package:rick_morty_flutter/src/models/domain/episode.dart';
import 'package:rick_morty_flutter/src/models/domain/location.dart';
export 'package:rick_morty_flutter/src/models/domain/location.dart';
import 'package:rick_morty_flutter/src/models/domain/character.dart';
export 'package:rick_morty_flutter/src/models/domain/character.dart';

abstract class DataProvider {
  Future<Character> getCharacter(int characterId);
  Future<List<Character>> getCharacters(List<int> characterIds);
  Future<Location> getLocation(int locationId);
  Future<List<Character>> getLocations(List<int> locationIds);
  Future<Episode> getEpisode(int episodeId);
  Future<List<Episode>> getEpisodes(List<int> episodeIds);
}
