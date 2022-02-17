import 'package:rick_morty_flutter/src/models/database/episode.dart';
import 'package:rick_morty_flutter/src/models/domain/episode.dart';
import 'package:rick_morty_flutter/src/models/network/network_episode.dart';

extension EpisodeMapper on Episode {
  static Episode fromDB(DBEpisode episode) {
    return Episode(
      episode.id,
      episode.name,
      episode.airDate,
      episode.episodeCode,
      episode.created,
    );
  }

  static Episode fromNetwork(NetworkEpisode episode) {
    return Episode(
      episode.id,
      episode.name,
      episode.airDate,
      episode.episodeCode,
      episode.created,
    );
  }

  static DBEpisode toDBEpisode(Episode episode, List<int> characterIds) {
    return DBEpisode(
      id: episode.id,
      name: episode.name,
      airDate: episode.airDate,
      episodeCode: episode.episodeCode,
      characters: characterIds,
      created: episode.created,
    );
  }
}
