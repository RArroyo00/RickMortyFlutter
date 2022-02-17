import 'network_response_info.dart';
import '../network_location.dart';

class CharactersResponse {
  CharactersResponse({
    required this.info,
    required this.results,
  });
  late final NetworkResponseInfo? info;
  late final List<NetworkLocation> results;

  CharactersResponse.fromJson(Map<String, dynamic> json) {
    info = NetworkResponseInfo.fromJson(json['info']);
    results = List.from(json['results'])
        .map((e) => NetworkLocation.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['info'] = info?.toJson();
    _data['results'] = results.map((e) => e.toJson()).toList();
    return _data;
  }
}
