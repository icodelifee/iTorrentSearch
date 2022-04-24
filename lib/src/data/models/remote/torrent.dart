import 'package:freezed_annotation/freezed_annotation.dart';

part 'torrent.freezed.dart';
part 'torrent.g.dart';

@freezed
abstract class Torrent with _$Torrent {
  const factory Torrent({
    required final String title,
    required final String seeds,
    required final String leechs,
    required final String size,
    required final String added,
    required final String link,
    required final String magnet,
  }) = _Torrent;

  factory Torrent.fromJson(Map<String, dynamic> json) => _$TorrentFromJson(json);
}
