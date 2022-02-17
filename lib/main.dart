import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rick_morty_flutter/src/app/app.dart';

import 'src/models/database/character.dart';
import 'src/models/database/episode.dart';
import 'src/models/database/location.dart';

void main() async {
  await Hive.initFlutter();
  _registerHiveAdapters(Hive);
  runApp(MyApp());
}

void _registerHiveAdapters(HiveInterface hive) {
  hive.registerAdapter(DBCharacterAdapter());
  hive.registerAdapter(DBEpisodeAdapter());
  hive.registerAdapter(DBLocationAdapter());
}
