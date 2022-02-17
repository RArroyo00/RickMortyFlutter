import 'package:rick_morty_flutter/src/models/network/network_character.dart';

abstract class NetworkDataProvider {
  Future<List<NetworkCharacter>>? getCharactersPage(int page);
}
