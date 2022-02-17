import 'package:hive/hive.dart';
part 'character.g.dart';

@HiveType(typeId: 1)
class DBCharacter extends HiveObject {
  DBCharacter({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.originName,
    required this.location,
    required this.locationName,
    required this.image,
    required this.episodes,
    required this.created,
  });
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String status;
  @HiveField(3)
  String species;
  @HiveField(4)
  String type;
  @HiveField(5)
  String gender;
  @HiveField(6)
  String origin;
  @HiveField(7)
  String originName;
  @HiveField(8)
  String location;
  @HiveField(9)
  String locationName;
  @HiveField(10)
  String image;
  @HiveField(11)
  List<int> episodes;
  @HiveField(12)
  String created;
}
