import 'character.dart';

class Location {
  Location(
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.created, {
    this.residents,
  });
  late final int id;
  late final String name;
  late final String? type;
  late final String dimension;
  late final List<Character>? residents;
  late final String created;
}
