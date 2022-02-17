class NetworkLocation {
  NetworkLocation({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });
  late final int id;
  late final String name;
  late final String? type;
  late final String dimension;
  late final List<String> residents;
  late final String url;
  late final String created;

  NetworkLocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    dimension = json['dimension'];
    residents = List.castFrom<dynamic, String>(json['residents']);
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['type'] = type;
    _data['dimension'] = dimension;
    _data['residents'] = residents;
    _data['url'] = url;
    _data['created'] = created;
    return _data;
  }
}
