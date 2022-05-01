import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular.freezed.dart';
part 'popular.g.dart';

@freezed
class Popular with _$Popular {
  const factory Popular({
    @JsonKey(name: 'backdrop_path') required final String backdropPath,
    required final List<String> genres,
    required final int id,
    required final String overview,
    required final double popularity,
    @JsonKey(name: 'poster_path') required final String posterPath,
    @JsonKey(name: 'release_date') required final DateTime releaseDate,
    required final int runtime,
    required final String tagline,
    required final String title,
    @JsonKey(name: 'imdb_id') required final String imdbId,
    @JsonKey(name: 'vote_average') required final double voteAverage,
  }) = _Popular;

  factory Popular.fromJson(Map<String, Object?> json) => _$PopularFromJson(json);
}
