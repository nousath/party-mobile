import 'package:json_annotation/json_annotation.dart';

part 'track.g.dart';

@JsonSerializable()
class Track extends Object with _$TrackSerializerMixin {
  Track();
  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  String id;

  String name;

  List<TrackArtist> artists;

  List<Image> images;

  String endpoint;

  @JsonKey(name: 'began_playing')
  String get beganPlayingNative => _beganPlaying?.toIso8601String();
  @JsonKey(name: 'began_playing')
  set beganPlayingNative(String dateTime) {
    _beganPlaying =
        DateTime.parse(dateTime.split('.').first + '.000000Z').toUtc();
  }

  @JsonKey(ignore: true)
  DateTime _beganPlaying;
  @JsonKey(ignore: true)
  DateTime get beganPlaying => _beganPlaying;

  int duration;

  String contributor;

  @JsonKey(name: 'contributor_id')
  int contributorId;
}

class PlayingTrack extends Track {
  PlayingTrack.fromTrack(Track track) {
    id = track.id;
    name = track.name;
    artists = track.artists;
    images = track.images;
    endpoint = track.endpoint;
    _beganPlaying = track.beganPlaying;
    duration = track.duration;
    contributor = track.contributor;
    contributorId = track.contributorId;
  }

  factory PlayingTrack.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    Track t = Track.fromJson(json);
    PlayingTrack track = new PlayingTrack.fromTrack(t);
    return track;
  }

  bool paused = true;

  int elapsed;

  bool isAdded = false;

  bool get isQueued => elapsed == null;
  bool get isPlaying => !paused;

  @override
  Map<String, dynamic> toJson() {
    this.beganPlayingNative = this.beganPlaying.toIso8601String();
    return this.toJson();
  }
}

@JsonSerializable()
class TrackArtist extends Object with _$TrackArtistSerializerMixin {
  TrackArtist();
  factory TrackArtist.fromJson(Map<String, dynamic> json) =>
      _$TrackArtistFromJson(json);

  String id;

  String name;
}

@JsonSerializable()
class Image extends Object with _$ImageSerializerMixin {
  Image();
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  int height;

  int width;

  String url;
}
