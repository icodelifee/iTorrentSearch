// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Torrent _$$_TorrentFromJson(Map<String, dynamic> json) => _$_Torrent(
      title: json['title'] as String,
      seeds: json['seeds'] as String,
      leechs: json['leechs'] as String,
      size: json['size'] as String,
      added: json['added'] as String,
      link: json['link'] as String,
      magnet: json['magnet'] as String,
    );

Map<String, dynamic> _$$_TorrentToJson(_$_Torrent instance) => <String, dynamic>{
      'title': instance.title,
      'seeds': instance.seeds,
      'leechs': instance.leechs,
      'size': instance.size,
      'added': instance.added,
      'link': instance.link,
      'magnet': instance.magnet,
    };
