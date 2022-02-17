import 'package:flutter/material.dart';
import 'package:rick_morty_flutter/src/models/domain/character.dart';

abstract class IHomeViewmodel {
  fetchCharacters();
  navigateToCharacterDetail(BuildContext context, Character character);
}
