import 'package:rick_morty_flutter/src/models/database/location.dart';
import 'package:rick_morty_flutter/src/models/network/network_location.dart';
import 'package:rick_morty_flutter/src/providers/data_provider.dart';

extension LocartionMapper on Location {
  static Location fromDB(DBLocation location) {
    return Location(
      location.id,
      location.name,
      location.type,
      location.dimension,
      location.created,
    );
  }

  static Location fromNetwork(NetworkLocation location) {
    return Location(
      location.id,
      location.name,
      location.type,
      location.dimension,
      location.created,
    );
  }

  static DBLocation toDBLocation(Location location, List<int> residentIds) {
    return DBLocation(
      id: location.id,
      name: location.name,
      type: location.type,
      dimension: location.dimension,
      residents: residentIds,
      created: location.created,
    );
  }
}
