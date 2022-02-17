import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:rick_morty_flutter/src/models/network/network_character.dart';
import 'package:rick_morty_flutter/src/models/network/responses/network_characters_response.dart';
import 'package:rick_morty_flutter/src/models/network/responses/network_response_info.dart';
import 'package:rick_morty_flutter/src/providers/network_data_provider.dart';
export 'package:rick_morty_flutter/src/models/network/responses/network_characters_response.dart';

import 'data_provider.dart';

class NetworkDataProviderImpl extends DataProvider with NetworkDataProvider {
  NetworkDataProviderImpl._internal();

  static final NetworkDataProviderImpl _instance =
      NetworkDataProviderImpl._internal();

  factory NetworkDataProviderImpl() {
    return _instance;
  }

  final String _path = 'rickandmortyapi.com';
  final String _character = 'api/character';
  bool _isLoading = false;

  Future<CharactersResponse> _processResponse(Uri uri) async {
    final response = await http.get(uri);
    final decodedResponse = json.decode(response.body);
    final CharactersResponse networkResponse =
        CharactersResponse.fromJson(decodedResponse);
    return networkResponse;
  }

  Future<List<NetworkCharacter>> _processSimpleResponse(Uri uri) async {
    final response = await http.get(uri);
    final decodedResponse = json.decode(response.body);
    final List<NetworkCharacter> networkResponse = List.from(decodedResponse)
        .map((e) => NetworkCharacter.fromJson(e))
        .toList();
    return Future<List<NetworkCharacter>>.value(networkResponse);
  }

  @Deprecated('Replaced by getCharactersPage method')
  Future<List<NetworkCharacter>>? getAllCharacters() async {
    final uri = Uri.https(_path, _character);
    List<NetworkCharacter> charactersList = List.empty(growable: true);
    CharactersResponse response = await _processResponse(uri);
    await _saveCharactersData(response.info);

    charactersList.addAll(response.results);
    List<NetworkCharacter>? randomCharacters =
        await _getRandomCharacters(response.info);
    if (randomCharacters != null) {
      charactersList.addAll(randomCharacters);
    }
    return Future<List<NetworkCharacter>>.value(charactersList);
  }

  Future<List<NetworkCharacter>>? _getRandomCharacters(
      NetworkResponseInfo? networkResponseInfo) async {
    List<NetworkCharacter> responseList = List.empty(growable: true);
    if (networkResponseInfo != null) {
      final uri = Uri.https(_path,
          "$_character/${_generateRandomIds(networkResponseInfo.count, 12)}");
      List<NetworkCharacter> response = await _processSimpleResponse(uri);
      responseList.addAll(response);
    }
    return Future<List<NetworkCharacter>>.value(responseList);
  }

  @override
  Future<List<NetworkCharacter>>? getCharactersPage(int page) async {
    if (_isLoading) {
      return [];
    }
    _isLoading = true;
    final uri = Uri.https(_path, _character, {'page': page.toString()});
    CharactersResponse response = await _processResponse(uri);
    _isLoading = false;
    return response.results;
  }

  @override
  Future<Character> getCharacter(int characterId) {
    // TODO: implement getCharacter
    throw UnimplementedError();
  }

  @override
  Future<List<Character>> getCharacters(List<int> characterIds) {
    // TODO: implement getCharacters
    throw UnimplementedError();
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

  String _generateRandomIds(int charactersCount, int requiredLength) {
    Random random = Random();
    Set set = {};
    do {
      set.add(random.nextInt(charactersCount));
    } while (set.length < requiredLength);
    return set.join(',');
  }

  _saveCharactersData(NetworkResponseInfo? info) {
    if (info != null) {}
  }
}
