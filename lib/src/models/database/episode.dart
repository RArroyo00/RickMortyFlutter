import 'package:hive/hive.dart';
part 'episode.g.dart';

@HiveType(typeId: 2)
class DBEpisode extends HiveObject {
  DBEpisode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episodeCode,
    required this.characters,
    required this.created,
  });
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String airDate;
  @HiveField(3)
  String episodeCode;
  @HiveField(4)
  List<int> characters;
  @HiveField(5)
  String created;
}
