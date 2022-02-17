import 'character.dart';

class Episode {
  Episode(this.id, this.name, this.airDate, this.episodeCode, this.created,
      {this.characters});
  int id;
  String name;
  String airDate;
  String episodeCode;
  List<Character>? characters;
  String created;
}
