import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rick_morty_flutter/src/base/base_viewmodel.dart';
import 'package:rick_morty_flutter/src/manager/routes_manager.dart';
import 'package:rick_morty_flutter/src/models/domain/character.dart';
import 'package:rick_morty_flutter/src/models/domain/mappers/character_mappers.dart';
import 'package:rick_morty_flutter/src/models/network/network_character.dart';
import 'package:rick_morty_flutter/src/pages/home/home_viewmodel.dart';
import 'package:rick_morty_flutter/src/providers/database_data_provider_impl.dart';
import 'package:rick_morty_flutter/src/providers/network_data_provider_impl.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelOutputs, IHomeViewmodel {
  final NetworkDataProviderImpl _networkDataProvider =
      NetworkDataProviderImpl();
  final DatabaseDataProviderImpl _dbDataProvider = DatabaseDataProviderImpl();

  final StreamController<HomeViewObject> _streamController =
      StreamController<HomeViewObject>.broadcast();

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _getInitialData();
  }

  @override
  Stream<HomeViewObject> get outputCharacters => _streamController.stream;

  Future<List<Character>> _getDatabaseCharacters() async =>
      await _dbDataProvider.getAllCharacters();

  _postCharacterList() async {
    List<Character> characters = await _getDatabaseCharacters();
    if (characters.isNotEmpty) {
      _streamController.sink.add(HomeViewObject(characters));
    }
  }

  _getInitialData() async {
    List<Character> localCharacters = await _getDatabaseCharacters();
    if (localCharacters.isNotEmpty) {
      _postCharacterList();
    } else {
      fetchCharacters();
    }
  }

  void _processCharactersData(List<NetworkCharacter>? results) async {
    List<Character>? characters =
        results?.map((e) => CharacterMapper.fromNetwork(e)).toList();
    if (characters != null) {
      _dbDataProvider.putCharacters(characters);
      await _postCharacterList();
    }
  }

  @override
  fetchCharacters() async {
    int targetPage = await _dbDataProvider.getLastVisitedCharacterPage() + 1;
    try {
      List<NetworkCharacter>? response =
          await _networkDataProvider.getCharactersPage(targetPage);
      if (response != null && response.isNotEmpty) {
        _processCharactersData(response);
        _dbDataProvider.setLastVisitedCharacterPage(targetPage);
      }
    } catch (exception) {
      print(exception.toString());
    }
  }

  @override
  navigateToCharacterDetail(BuildContext context, Character character) {
    Navigator.pushNamed(context, Routes.detailRoute, arguments: character);
  }
}

abstract class HomeViewModelOutputs {
  Stream<HomeViewObject> get outputCharacters;
}

class HomeViewObject {
  List<Character> mainCharacters;

  HomeViewObject(this.mainCharacters);
}
