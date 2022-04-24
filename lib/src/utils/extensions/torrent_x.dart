import '../../data/models/remote/torrent.dart';

extension TorrentX on Torrent {
  bool get isNotEmpty {
    return title.isNotEmpty && magnet.isNotEmpty;
  }
}
