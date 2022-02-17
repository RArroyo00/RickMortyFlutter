import 'dart:async';

import 'package:rick_morty_flutter/src/base/base_viewmodel.dart';
import 'package:rick_morty_flutter/src/models/domain/character.dart';
import 'package:rick_morty_flutter/src/pages/character/character_detail_viewmodel.dart';
import 'package:rick_morty_flutter/src/providers/database_data_provider_impl.dart';
import 'package:rick_morty_flutter/src/providers/network_data_provider_impl.dart';

class CharacterDetailViewModel extends BaseViewModel
    with CharacterDetailViewModelOutputs, ICharacterDetailViewModel {
  final NetworkDataProviderImpl _networkDataProvider =
      NetworkDataProviderImpl();
  final DatabaseDataProviderImpl _dbDataProvider = DatabaseDataProviderImpl();
  final StreamController<CharacterDetailViewObject> _streamController =
      StreamController<CharacterDetailViewObject>.broadcast();
  late Character _character;

  set character(Character character) {
    _character = character;
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  Stream<CharacterDetailViewObject> get outputCharacter =>
      _streamController.stream;

  @override
  void start() {
    _postCharacterInfo();
  }

  _postCharacterInfo() {
    _streamController.sink.add(CharacterDetailViewObject(_character));
  }
}

abstract class CharacterDetailViewModelOutputs {
  Stream<CharacterDetailViewObject> get outputCharacter;
}

class CharacterDetailViewObject {
  Character character;

  CharacterDetailViewObject(this.character);
}
