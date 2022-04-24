// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Popular _$PopularFromJson(Map<String, dynamic> json) => Popular(
      backdropPath: json['backdrop_path'] as String,
      genres: (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      id: json['id'] as int,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String,
      releaseDate: DateTime.parse(json['release_date'] as String),
      runtime: json['runtime'] as int,
      tagline: json['tagline'] as String,
      title: json['title'] as String,
      imdbId: json['imdb_id'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$PopularToJson(Popular instance) => <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'genres': instance.genres,
      'id': instance.id,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate.toIso8601String(),
      'runtime': instance.runtime,
      'tagline': instance.tagline,
      'title': instance.title,
      'imdb_id': instance.imdbId,
      'vote_average': instance.voteAverage,
    };

_$_Popular _$$_PopularFromJson(Map<String, dynamic> json) => _$_Popular(
      backdropPath: json['backdrop_path'] as String,
      genres: (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      id: json['id'] as int,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String,
      releaseDate: DateTime.parse(json['release_date'] as String),
      runtime: json['runtime'] as int,
      tagline: json['tagline'] as String,
      title: json['title'] as String,
      imdbId: json['imdb_id'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PopularToJson(_$_Popular instance) => <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'genres': instance.genres,
      'id': instance.id,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate.toIso8601String(),
      'runtime': instance.runtime,
      'tagline': instance.tagline,
      'title': instance.title,
      'imdb_id': instance.imdbId,
      'vote_average': instance.voteAverage,
    };
