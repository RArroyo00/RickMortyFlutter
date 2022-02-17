import 'package:hive/hive.dart';
part 'location.g.dart';

@HiveType(typeId: 3)
class DBLocation extends HiveObject {
  DBLocation({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.created,
  });
  @HiveField(0)
  late final int id;
  @HiveField(1)
  late final String name;
  @HiveField(2)
  late final String? type;
  @HiveField(3)
  late final String dimension;
  @HiveField(4)
  late final List<int> residents;
  @HiveField(5)
  late final String created;
}
