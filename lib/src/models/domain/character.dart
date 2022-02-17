import 'package:rick_morty_flutter/src/models/domain/location.dart';

class Character {
  Character(
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    this.originName,
    this.originId,
    this.locationName,
    this.locationId,
    this.created, {
    this.origin,
    this.location,
    this.uuid = "",
  });
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Location? origin;
  String originName;
  String originId;
  Location? location;
  String locationName;
  String locationId;
  String image;
  String created;
  String uuid;
}
